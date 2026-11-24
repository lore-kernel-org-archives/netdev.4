Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540153;
	b=NAMD+qYehYUVHKUJPHIni/mVY+yd0rd7Rk6xUNoPfguOnIExAWpNXLXp4U5JTf+EgvYy
	 v+pBxh0KvLssC/ETz1VWk+LRIIvLsdGCg6yYpABzuS2g/Mh56qObUcQTEx6UMQqA+SPYG
	 ms1MWd4eZeo7lIIl2i5n0AxrDaNdZruCqT8hu9gdifAyz9Xj9IEwbvr5tVwL+2WRIeXf1
	 sAS8vcJk3hcMCRhXm87onVyupO35BSKqPScvskEpKatqI3OGem9OWhiMV8J7J4QitB8uK
	 cy8KNeKud1HjMdzjlxcHmNZz8mUhvtgcmA7PoJNNBMDNadSTNoYOfsylLKLqw4rts5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X9VL+UZGuvvn+L4e88A9yFSdMmbH0iKnEH4T++PwoT0=;
	b=XZ+IosqB974fR5wW5FSudaN9tZ2IEmX6l+wxjJUvLgVOMiBuXobbKPa9FG/q/SrolFio
	 8D2t5EOlL2r64rbzrWOjoWRiPD9a46PvPqYb7zGlURdbjlRhO8zaJG83rAexRMMi8aPAB
	 Wppju1jlBhJKNPQ3nPQZQ0M/EAOcPZVLNtiPhNjGQSw6EmBB2/jM1tPnre9oGec9YIy6C
	 AvErLV9KofWIy4DKT+pQBzEeEb6DjsMA8rkaGL1A2+BCgXHxQHmuAL5XBfO+I/gq63Zoa
	 b3o2zbjj9w4cle/rsWn/FNCrELnmk0TgnZQtZQoH/p0Tdd9G1VRuUWDK4fmJ9NZGrQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3ofmZ51;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204AF60A262B
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 204AF60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3ofmZ51
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso2433008a12.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540152; cv=none;
        d=google.com; s=arc-20260327;
        b=RBp6Zo71hQcKVMOjriWiQb9ZvLMoZWpXY3DoWMo5p30JLkDPFPwJyZ5bSxEhuVLBgU
         HQbLJsQc3ra+5pGoTBYuZhF9gkwliC2HZWd1SDA+tzJyF7cAfWcSOI3RjVxilmwLpCVL
         /pqymO59/gMTUuCkORJ0MI2doorp5iLBDIZ68cOsabMLE8tiS0Kzj/+v2hMjKfDwnlYo
         4I6xOfkdMU8W+oXV8xyWC98r2PgJRbj2WZAObzx39HPxgk4pzsczM7FY790uBx47112Y
         zDeAEOouWAqCt1qsGExD8r7g97p1Yu76GC0DJP6AU+z2dTFSwHiTj0K1QlojPCjih+95
         4rUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X9VL+UZGuvvn+L4e88A9yFSdMmbH0iKnEH4T++PwoT0=;
        fh=kOeNUMtxOSWwlHYKPzmuibXz7Smd2IEiLW8nQctqOew=;
        b=S4F13acj7nwZ5pX7lLpZ15Kpo3wGfKhNcL+oEhM4faisHnMs6W6OpP3bw7TGSaVMQE
         XMzPQaF+hbd5efTNLwV0zFEqw9WceLmgYRyWNJqOrIEjKI8pQ93yyzzqd7laPDmOkJW1
         WRmkCVLjx6zBTofAvHBTufjQ+J/Mj9umtyGmma3PnGQQNn+DFFgSRerGUpaBKznewptD
         KwB0ZqzbquUpiy95u7BH9R7kOxPV5ox53DJcW4XK9EqeDA2/00d84h+iZuEUkOrLuRkB
         H0A+cY+J4ZBx1vxDQTuTy7yMX6lFNKcb44ts7KkNr+U/UHyIFIzWLH+Ued/s5ifpruR0
         LN/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540152; x=1796144952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X9VL+UZGuvvn+L4e88A9yFSdMmbH0iKnEH4T++PwoT0=;
        b=q3ofmZ51KdDiSe31lFyb1pGcKM2i5v6DnKfzrg+Pky/e9KyGKb1/+AkYl9QZ9sR3du
         rj+nBMjVGvXqgjlFfny2JCQCIRfswUsErqN7P3Yu3Kl4Wr0hHhZg+XxKijd5Q6fAKWR4
         6NVEsE4P3Uib7ty8eOkbDpbZkWkUpOW6Onh7y4dGdlvMtpqtZIWn+8rKO+i/cpPY/HY7
         huQTRNe46nKtyvdSuzaLClrIVBxyPmYoJmfyspB53oTKgr8sZljTPJKBRbXPKmmzlweO
         g+U4obngtO0yjgCUOK3gaB5CYU5lHY96yfGFG2lH32X/OHwq1g9lzqUfrsKqhRLSnGCV
         4GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540152; x=1796144952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9VL+UZGuvvn+L4e88A9yFSdMmbH0iKnEH4T++PwoT0=;
        b=bHoMS5AV1ymyrZKpGY6jVQu/ZFMGmux6PNzfIetuwlPsmfqi2TG6NZp4zCBXUX4eAf
         T4WFBxIp5+SX53BaWiMvU4pHNOuiwQME87d+drku29tBrRX1CIwpr1xkgH8KyU9TFFjO
         WJ09qsgU5wHm4p7ozwu726A5yi6itv28eZ4Jm+u+6LbkQglUKXOcUaNk1RmQ0HhnsKuz
         HH97P7tTDx10F9FRw+7CjVKP2r7Q4jdNn8AJPrxJaDoBDdRSLzZWOy463sCHyfcHaFiM
         CoIY3vrSY/Hg4spDF4RTJM6YVo/Q6kxDNJz9j/uptnqgmDBSYyRFT//goixM1K2PSj6Y
         jyVw==
X-Forwarded-Encrypted: i=1; AL+hErGt7vRnT3QiykY7NNWuM3DqWNP1ZlfU10wWhIl+QkgSSJZL1Xu/07/7OjzTrdamgni3OJHxM6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jfOuAizMnD7cMb25BqZamrgNJf8dt+1CQdOnCd4BxQ48rEPIN
	U+jWaej11clWS14t/GN5rMMtwknNMTn72eM4tF0TjyQ2T8LKXU29zBA2Ejys0Y9lreZSeQ2IVyJ
	6N6zkPVfihweoS0HAcDpD/na47QUdlSI=
X-Gm-Gg: AZFdTZfgQ4z7heRGwXPC1TTLbDN2fv98AFYbHFS6oJNtrjpyrfbL9nNhYJnYfk/usuk
	xrXnF/mtDUbM9wsjy2Wid3cToVXX2Q1H3aNesSuzFqYnwMYBc6J9wClnUfWL5+q9xKAtfUBLJgJ
	JrayEhaS2rIjcek+G/59mqlcWYindBSiUPPsaJPNQBa/jBqlSiP1OgWrI5Hkj5oWL5Tb8WkmAmn
	IIMub/ZPyVPpaH/TlTsOJLKk/9LxY8xXH5knWwuJ3GMu98r/9BoM5LSuNHnuXV7CHGb2t6sy5yF
	YmySBLassTDgp/Ghxk7lzX8vo5TrtsGFSbnq85MdjOtuOfg7RCCO0mTZroPf72Uk9Iw/BsGe9l4
	HZibA8NVTsi3O7aHaxEEBxsn4XhKjj+ekOcrrU4dQqeOObp5T+OdIWbIMa7nuqL6pHewldK4YBf
	3V+3DPkH0K08sSLXy8tdfEdixwu0poexa7LZuxqA==
X-Received: by 2002:a05:6a20:6a06:b0:3f8:443c:4ce1 with SMTP id
 adf61e73a8af0-4014db57950mr17323321637.29.1795540152313; Tue, 24 Nov 2026
 09:09:12 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179539544818.3016044.13738712075053349592@gmail.com> <179539544818.3016044.18009252996572506068@gmail.com>
In-Reply-To: <179539544818.3016044.18009252996572506068@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 12:09:01 -0500
X-Gm-Features: Aa3M54o3Mm28v-FnGzbOeKj4VXKtMVAJcVd8119mGvZOM1SygJE7tskfr7xggbY
Message-ID: <CADvbK_de1zGLfjvEk-BJYcv5SsEzqC2RwL3R7qt7sWL09aCmow@mail.gmail.com>
Subject: Re: [PATCH net v3 1/1] sctp: fail the association when the INIT-ACK
 cannot be processed
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, Jun Yang <junvyyang@tencent.com>, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:09=E2=80=AFPM Kyuwon Cho <kyuwoncho18@gmail.com>=
 wrote:
>
> sctp_sf_do_5_1C_ack() queues SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY.
> If either fails to allocate memory, sctp_cmd_interpreter() stops there,
> but the association stays: with the peer marked AUTH capable and
> asoc->shkey still NULL, a chunk that the peer wants authenticated, such
> as the ABORT built by close() with SO_LINGER {1, 0}, takes a reference
> on the NULL key:
>
>   BUG: KASAN: null-ptr-deref in sctp_auth_shkey_hold (net/sctp/auth.c:113=
)
>   Write of size 4 at addr 0000000000000018
>   Call Trace:
>    sctp_auth_shkey_hold (net/sctp/auth.c:113)
>    sctp_control_set_owner_w (net/sctp/sm_make_chunk.c:112)
>    sctp_make_abort_user (net/sctp/sm_make_chunk.c:1016)
>    sctp_close (net/sctp/socket.c:1564)
>
> Process the INIT-ACK and set up the association key directly in
> sctp_sf_do_5_1C_ack(), and fail the association if either step fails.
> SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY have no other users, so
> remove them.
>
> Fixes: 1b1e0bc99474 ("sctp: add refcnt support for sh_key")
> Suggested-by: Xin Long <lucien.xin@gmail.com>
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
>  include/net/sctp/command.h |  4 ----
>  net/sctp/sm_sideeffect.c   | 40 --------------------------------------
>  net/sctp/sm_statefuns.c    | 15 +++++++++++---
>  3 files changed, 12 insertions(+), 47 deletions(-)
>
> diff --git a/include/net/sctp/command.h b/include/net/sctp/command.h
> index 2058fabffbf6..8596e96c321a 100644
> --- a/include/net/sctp/command.h
> +++ b/include/net/sctp/command.h
> @@ -34,7 +34,6 @@ enum sctp_verb {
>         SCTP_CMD_GEN_SACK,      /* Send a Selective ACK (maybe).  */
>         SCTP_CMD_PROCESS_SACK,  /* Process an inbound SACK.  */
>         SCTP_CMD_GEN_INIT_ACK,  /* Generate an INIT ACK chunk.  */
> -       SCTP_CMD_PEER_INIT,     /* Process a INIT from the peer.  */
>         SCTP_CMD_GEN_COOKIE_ECHO, /* Generate a COOKIE ECHO chunk. */
>         SCTP_CMD_CHUNK_ULP,     /* Send a chunk to the sockets layer.  */
>         SCTP_CMD_EVENT_ULP,     /* Send a notification to the sockets lay=
er. */
> @@ -86,7 +85,6 @@ enum sctp_verb {
>         SCTP_CMD_ASSOC_CHANGE,   /* generate and send assoc_change event =
*/
>         SCTP_CMD_ADAPTATION_IND, /* generate and send adaptation event */
>         SCTP_CMD_PEER_NO_AUTH,   /* generate and send authentication even=
t */
> -       SCTP_CMD_ASSOC_SHKEY,    /* generate the association shared keys =
*/
>         SCTP_CMD_T1_RETRAN,      /* Mark for retransmission after T1 time=
out  */
>         SCTP_CMD_UPDATE_INITTAG, /* Update peer inittag */
>         SCTP_CMD_SEND_MSG,       /* Send the whole use message */
> @@ -117,7 +115,6 @@ union sctp_arg {
>         struct sctp_association *asoc;
>         struct sctp_transport *transport;
>         struct sctp_bind_addr *bp;
> -       struct sctp_init_chunk *init;
>         struct sctp_ulpevent *ulpevent;
>         struct sctp_packet *packet;
>         struct sctp_sackhdr *sackh;
> @@ -158,7 +155,6 @@ SCTP_ARG_CONSTRUCTOR(CHUNK, struct sctp_chunk *, chun=
k)
>  SCTP_ARG_CONSTRUCTOR(ASOC,     struct sctp_association *, asoc)
>  SCTP_ARG_CONSTRUCTOR(TRANSPORT,        struct sctp_transport *, transpor=
t)
>  SCTP_ARG_CONSTRUCTOR(BA,       struct sctp_bind_addr *, bp)
> -SCTP_ARG_CONSTRUCTOR(PEER_INIT,        struct sctp_init_chunk *, init)
>  SCTP_ARG_CONSTRUCTOR(ULPEVENT,  struct sctp_ulpevent *, ulpevent)
>  SCTP_ARG_CONSTRUCTOR(PACKET,   struct sctp_packet *, packet)
>  SCTP_ARG_CONSTRUCTOR(SACKH,    struct sctp_sackhdr *, sackh)
> diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
> index 35f540fb15fc..a95bf10b852b 100644
> --- a/net/sctp/sm_sideeffect.c
> +++ b/net/sctp/sm_sideeffect.c
> @@ -698,32 +698,6 @@ static void sctp_cmd_assoc_failed(struct sctp_cmd_se=
q *commands,
>         sctp_add_cmd_sf(commands, SCTP_CMD_DELETE_TCB, SCTP_NULL());
>  }
>
> -/* Process an init chunk (may be real INIT/INIT-ACK or an embedded INIT
> - * inside the cookie.  In reality, this is only used for INIT-ACK proces=
sing
> - * since all other cases use "temporary" associations and can do all
> - * their work in statefuns directly.
> - */
> -static int sctp_cmd_process_init(struct sctp_cmd_seq *commands,
> -                                struct sctp_association *asoc,
> -                                struct sctp_chunk *chunk,
> -                                struct sctp_init_chunk *peer_init,
> -                                gfp_t gfp)
> -{
> -       int error;
> -
> -       /* We only process the init as a sideeffect in a single
> -        * case.   This is when we process the INIT-ACK.   If we
> -        * fail during INIT processing (due to malloc problems),
> -        * just return the error and stop processing the stack.
> -        */
> -       if (!sctp_process_init(asoc, chunk, sctp_source(chunk), peer_init=
, gfp))
> -               error =3D -ENOMEM;
> -       else
> -               error =3D 0;
> -
> -       return error;
> -}
> -
>  /* Helper function to break out starting up of heartbeat timers.  */
>  static void sctp_cmd_hb_timers_start(struct sctp_cmd_seq *cmds,
>                                      struct sctp_association *asoc)
> @@ -1397,16 +1371,6 @@ static int sctp_cmd_interpreter(enum sctp_event_ty=
pe event_type,
>                                         SCTP_CHUNK(new_obj));
>                         break;
>
> -               case SCTP_CMD_PEER_INIT:
> -                       /* Process a unified INIT from the peer.
> -                        * Note: Only used during INIT-ACK processing.  I=
f
> -                        * there is an error just return to the outter
> -                        * layer which will bail.
> -                        */
> -                       error =3D sctp_cmd_process_init(commands, asoc, c=
hunk,
> -                                                     cmd->obj.init, gfp)=
;
> -                       break;
> -
>                 case SCTP_CMD_GEN_COOKIE_ECHO:
>                         /* Generate a COOKIE ECHO chunk.  */
>                         new_obj =3D sctp_make_cookie_echo(asoc, chunk);
> @@ -1772,10 +1736,6 @@ static int sctp_cmd_interpreter(enum sctp_event_ty=
pe event_type,
>                         sctp_cmd_peer_no_auth(commands, asoc);
>                         break;
>
> -               case SCTP_CMD_ASSOC_SHKEY:
> -                       error =3D sctp_auth_asoc_init_active_key(asoc,
> -                                               GFP_ATOMIC);
> -                       break;
>                 case SCTP_CMD_UPDATE_INITTAG:
>                         asoc->peer.i.init_tag =3D cmd->obj.u32;
>                         break;
> diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
> index 6a4205de0aa6..fd9f94c12d42 100644
> --- a/net/sctp/sm_statefuns.c
> +++ b/net/sctp/sm_statefuns.c
> @@ -603,13 +603,22 @@ enum sctp_disposition sctp_sf_do_5_1C_ack(struct ne=
t *net,
>
>         initchunk =3D (struct sctp_init_chunk *)chunk->chunk_hdr;
>
> -       sctp_add_cmd_sf(commands, SCTP_CMD_PEER_INIT,
> -                       SCTP_PEER_INIT(initchunk));
> +       if (!sctp_process_init((struct sctp_association *)asoc, chunk,
> +                              sctp_source(chunk), initchunk, GFP_ATOMIC)=
) {
> +               sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
> +                               SCTP_PERR(SCTP_ERROR_NO_RESOURCE));
> +               return SCTP_DISPOSITION_CONSUME;
> +       }
>
>         /* SCTP-AUTH: generate the association shared keys so that
>          * we can potentially sign the COOKIE-ECHO.
>          */
> -       sctp_add_cmd_sf(commands, SCTP_CMD_ASSOC_SHKEY, SCTP_NULL());
> +       if (sctp_auth_asoc_init_active_key((struct sctp_association *)aso=
c,
> +                                          GFP_ATOMIC)) {
> +               sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
> +                               SCTP_PERR(SCTP_ERROR_NO_RESOURCE));
> +               return SCTP_DISPOSITION_CONSUME;
> +       }
Please change the error process to:

                if (err_chunk)
                        sctp_chunk_free(err_chunk);
                return sctp_stop_t1_and_abort(net, commands,
                                              SCTP_ERROR_NO_RESOURCE, ENOME=
M,
                                              asoc, chunk->transport);

in the two places above as Clashiko [1] suggested.

You may also want to confirm and address the issue reported in
sctp_assoc_update()
in a separate patch.

Thanks.
>
>         /* Reset init error count upon receipt of INIT-ACK.  */
>         sctp_add_cmd_sf(commands, SCTP_CMD_INIT_COUNTER_RESET, SCTP_NULL(=
));
> --
> 2.43.0
>

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179539544818.301604=
4.18009252996572506068%40gmail.com
