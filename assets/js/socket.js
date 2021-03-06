// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/web/endpoint.ex":
import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

// When you connect, you'll often need to authenticate the client.
// For example, imagine you have an authentication plug, `MyAuth`,
// which authenticates the session and assigns a `:current_user`.
// If the current user exists you can assign the user's token in
// the connection for use in the layout.
//
// In your "lib/web/router.ex":
//
//     pipeline :browser do
//       ...
//       plug MyAuth
//       plug :put_user_token
//     end
//
//     defp put_user_token(conn, _) do
//       if current_user = conn.assigns[:current_user] do
//         token = Phoenix.Token.sign(conn, "user socket", current_user.id)
//         assign(conn, :user_token, token)
//       else
//         conn
//       end
//     end
//
// Now you need to pass this token to JavaScript. You can do so
// inside a script tag in "lib/web/templates/layout/app.html.eex":
//
//     <script>window.userToken = "<%= assigns[:user_token] %>";</script>
//
// You will need to verify the user token in the "connect/2" function
// in "lib/web/channels/user_socket.ex":
//
//     def connect(%{"token" => token}, socket) do
//       # max_age: 1209600 is equivalent to two weeks in seconds
//       case Phoenix.Token.verify(socket, "user socket", token, max_age: 1209600) do
//         {:ok, user_id} ->
//           {:ok, assign(socket, :user, user_id)}
//         {:error, reason} ->
//           :error
//       end
//     end
//
// Finally, pass the token on connect as below. Or remove it
// from connect if you don't care about authentication.

socket.connect()

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("updates:all", {})

const newMsg = function(payload) {
  let msg_card = document.createElement("div");
  msg_card.className = "card my-2";
  
  let card_body = document.createElement("div");
  card_body.className = "card-body";
  msg_card.appendChild(card_body);
  
  let user = document.createElement("h4");
  user.className = "card-title";
  let user_link = document.createElement("a");
  user_link.href = payload.user_path;
  user_link.className = "text-dark";
  user_link.innerText = payload.message_user
  user.appendChild(user_link);
  card_body.appendChild(user);

  let msg_content = document.createElement("p");
  msg_content.className = "card-text";
  let msg_link = document.createElement("a");
  msg_link.href = payload.message_path;
  msg_link.className = "text-dark";
  msg_link.innerText = payload.message_content;
  msg_content.appendChild(msg_link);
  card_body.appendChild(msg_content);

  let likes = document.createElement("p");
  likes.innerText = "Likes: 0";
  card_body.appendChild(likes);

  return msg_card;
}

channel.on("new_msg", payload => {
  let message = newMsg(payload);
  $("#messages").prepend(message);
})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

export default socket
