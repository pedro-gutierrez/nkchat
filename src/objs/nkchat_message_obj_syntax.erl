%% -------------------------------------------------------------------
%%
%% Copyright (c) 2017 Carlos Gonzalez Florido.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

%% @doc Message Syntax
-module(nkchat_message_obj_syntax).
-author('Carlos Gonzalez <carlosj.gf@gmail.com>').

-export([api/3]).

-include("nkchat.hrl").

%% ===================================================================
%% Syntax
%% ===================================================================


%% @doc
api('', create, Syntax) ->
    Base = nkdomain_obj_syntax:syntax('', create, ?CHAT_MESSAGE, Syntax),
    Base#{
        conversation_id => binary,
        ?CHAT_MESSAGE => #{
            text => binary,
            '__mandatory' => [text]
        },
        '__mandatory' => [conversation_id]
    };

api(Sub, Cmd, Syntax) ->
    nkdomain_obj_syntax:syntax(Sub, Cmd, ?CHAT_MESSAGE, Syntax).
