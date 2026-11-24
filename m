Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795529805;
	b=sPUhzYROU04ih25Y+/dxwYrpCMc/rM427gQIEOwBvxpxrglNEowzVsOKF6BJdUItYBPi
	 IkZU6l77uGBjyluPHqfJ6xKEv5AKrOiaiIhy5/wpjE+ekwlM4txtVSA6lmNsT5/lqx17N
	 pCwmsmDEDK9xjjcPJTVXb1OhkwSJIjJwjzRX/9mIgOKylz/h0sByeMUpNdDLuuSJLeJ5e
	 QvxFvGf86n6cBvWgf4hxbhp98USXOZPWCf4G9Ok1VhqS+xnTrAeDeNwrtacVYV2gNQ+E6
	 7IMMWiFPeb+o6s87bE/VQqXNahjd9Syo+zEKZJeXlYn4veC5Yz8URm99afchqPLMhoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L/y4bV9sg4YOxw1y8ENYHV1fp3m5L4dzAun12g4rsko=;
	b=1FuLlGLvD8KgAEdN68g1L1Y9T4XZS58Bs9BiI2wl0Z7X/pxixgmRHMcZY2ccl6K23sQl
	 P8V8KSVarMy7MpgykBGTly/SjPcy3iiiBfh5ly0cht5Vv/v8TSFGhM4gE6snSicmAfikw
	 3ixvQAkkfAjc0yW6hNHT0LxRu7cO8AfVq19xg6X0Lhql1bZwOgJ70eCeKBfhEVfFnVk+i
	 lMKijUC7sCL/xottdN9zyafZtYb6d7O06CkgxDWCilw0cx/8FSfLvoBQUM6a6pNqw/3KI
	 xEHrlmMMi99vFE+dtNJiGMEuRCioeaFwBz5QtkCk8Pqffg5P60MkfQ+Ynd8N+eB5vIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weQ92RIT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6100606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6100606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weQ92RIT
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso3213899b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795529804; cv=none;
        d=google.com; s=arc-20260327;
        b=GE/rjVudxTGEi/NxQ9JfoJ4XvKw5mJSIIKEUfA8iP7SMM8Cws1pOUh96StmKMqMAfS
         wydKczOVyGxV7XC01NU6vM/LpJEuJGUtml8zDUAgCBFWp7l4zbG+Eo7wTSkLDoN526Wo
         a/3cxsKFz6mJ38BjseTykYQzvKA+tIq1aRwULVqbaoK58/g9p4Zj9Q83yuwEQUytKe5/
         4OzmZjsehh1pcXvGNsQee5+bR0J7Dboiyr+FPbUySvpP6AjRLO5QMg+qVGYm1YoGP3Cq
         bXGoL1vzLv2hxvxXdySo+GIajHo/fgAwVVD4FIG0tapBan0OCiHzkPxAq38ggsOQ728V
         VzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L/y4bV9sg4YOxw1y8ENYHV1fp3m5L4dzAun12g4rsko=;
        fh=jCkvnuPOoXUc6CeN7RQFIjUTkf2tb6of0sqkdAD7IhI=;
        b=SnwvXOVcBnQ7xAn3sFEYTxEkB85hiYIsjCu8c/l/b8dzYFxYpgu3iRQ8fjsCAR1fRJ
         x9H45h7MunY0/AzMlyVPP5MAIG5q3Wcc1Ilh2CWd1mALFhlWI6SEUbFmNdkfSbYwUCxn
         5d5ONNzJ1jL8b+y6FFszHsf0gE2jyjGdSDJUHDMnZY1eQIDjuRd6kIwZ1uVOPOQtc1BY
         25anLD6u4pWoDCGp7vOIk415/AAj3pjvE8im2GioTqZ4azvgDTjr7pdnm/g/G1RS8Zur
         Y6kllbn0NHqCvb07y0d7ul5zmif77udjNVxm17wyT29CeGhIFhfnUiIolSzzMSz4G4Wv
         MSAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529804; x=1796134604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/y4bV9sg4YOxw1y8ENYHV1fp3m5L4dzAun12g4rsko=;
        b=weQ92RITyg7JmS1ykhrmtx4rlzxrZ8f1H1jsn5wV5Al9jkvd8yL1HAtKWhLsplTmtP
         4UL7LauOKi3Ccq5BbdE6mSY6U0Cgxi/paZI+iqEv8X3XOgQGITF6ixm9aJOwWDfx3fg3
         wxWYuWesUJnEGfgEsDueZuPB0LjIq1kjRtkgyleFN1mJa/Mh3rX6cfYN7QSyvNYvClDL
         q3D97ZPX6erhS4ivNSE2ZS+2pr2eZledrjKcBQDPZf+3L9QFotwb/INCmvCBb/Z2WGhL
         3H2xdE71U3IjonoBsdTPjvPsax2cfwPIM4XfNArI18KPUkycKWNcgdxeDyFlWU6n9/ZW
         A9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529804; x=1796134604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/y4bV9sg4YOxw1y8ENYHV1fp3m5L4dzAun12g4rsko=;
        b=gq7IqP815V6znHk2Xkm6xK0HfzodwYlRGMpidaaBJk8BR7tVz9eKL19m2/pEu6RcDS
         1o7f8re2dYIaJZmyASfHu7AoJu3VJ8K9BMCiAHviIvJm76RAfYwRsHbhLZt89M3PS0c7
         QVyjPpUh8AxNkeqn5bQkaXDzSwQYPl27lyYC0h0GuGM3GoEzksBOk03S3CkZnbDbDIs3
         veIyfbBFc8AjSTd1kxFopYKByR960qUfPHtdJsB+GZMf6Wa7KcIRwbTKRypCIbkA94uh
         W7VMsg4dowKW4SN1XiT9YmVn5e7huPTl2dBFWQz44izlmjlB89Ge7VDvJOyXIByl7MWP
         R8+A==
X-Forwarded-Encrypted: i=1; AL+hErHXADfhQeaayD2XL7L5RBLJl4J4xiQLz4GMaiSMviE+TJzQozpeF1L6H7nnuQPLIrHKUoBO5tk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O7Q4GOKIz7ybVSmrVMXU199bAAiwmNbfK83Sujhpx3hUbeh/P
	lJusA1aSek8aaNzFB5FF/Ma2EzM8Y38gdU8JHjnWGb6GwvxhspxwGE0mk/J6tS5qmNdckH4OK1w
	+wiX+1FrtvjhnPK0iKQiHlUtKQrosCRQ=
X-Gm-Gg: AZFdTZcF06aPjq3qWXsXEU7diXKJf8eMNXmFa4kx42112rKPbbxAzpr0f3TRM63CQok
	oPfVoUFZisAtZqDerqdqSWYVq6mb5SkMFd7fY4WSv2kG7vQd+TmI3ahdXq2u182s9QFIEE3+9UU
	1uDV/Bb02+Ded5fVcXSJeAN197YGph2TlwcXT3DBBlomqFjOpyFMfbUS43GlBPZ4024AdfTNR02
	7+yDG+5Ftzf61g/rq6Mhg7Ofuzo6Ka3E9dJc0+uMEzoLiiD04D/BYunHh6Llu3l9LUhCPPRppF+
	jNBYPO4aA6sgkU1LoXmBoIxZUxkX67+SAuhp73aqBZQQtEPioKBLeDG6Nbz6hfI1BAYtBpcpnj/
	OLbDS2PqqHFFLriPOLN5w6lIY95ntifqWAfrvxi0++1n2XxRsxIwgv6M/kDjMZ6ueK5dG8QCLFr
	x+wN3UbQEeXvsSMwB7+NGig//8+fiY+Xk1pDy0y3UTutz4YuREi3rCQnr3o4HU
X-Received: by 2002:a05:6a00:1382:b0:882:7bed:3b3b with SMTP id
 d2e1a72fcca58-8c87c481e1cmr12587650b3a.36.1795529803877; Tue, 24 Nov 2026
 06:16:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179542222978.3276016.1235014191109840927@gmail.com>
In-Reply-To: <179542222978.3276016.1235014191109840927@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 09:16:32 -0500
X-Gm-Features: Aa3M54qTcW6bjqprusjNBKAhplLWpxLKJ9CCK3e-KLDt8tRi922IzPjzhVFOK78
Message-ID: <CADvbK_d1QSJ3sDjLY1G4etCgsnrdzu-nXnxJoDvGR7gTot95iA@mail.gmail.com>
Subject: Re: [PATCH net] sctp: pick the AUTH key by the data chunk type that
 is sent
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Neil Horman <nhorman@tuxdriver.com>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 3:26=E2=80=AFAM Kyuwon Cho <kyuwoncho18@gmail.com> =
wrote:
>
> sctp_datamsg_from_user() takes the chunk key only when the peer asked
> to authenticate DATA, but with stream interleaving the message is sent
> as I-DATA chunks, and _sctp_make_chunk() marks those for AUTH when the
> peer asked for I-DATA. If the peer lists I-DATA but not DATA, the chunk
> has auth set and no key, and bundling the AUTH chunk dereferences it:
>
>   KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
>   RIP: 0010:sctp_packet_append_chunk (net/sctp/output.c:264)
>   Call Trace:
>    <TASK>
>    sctp_packet_transmit_chunk (net/sctp/output.c:189)
>    sctp_outq_flush (net/sctp/outqueue.c:1112 net/sctp/outqueue.c:1218)
>    sctp_do_sm (net/sctp/sm_sideeffect.c:1826)
>    sctp_primitive_SEND (net/sctp/primitive.c:163)
>    sctp_sendmsg_to_asoc (net/sctp/socket.c:1919)
>    sctp_sendmsg (net/sctp/socket.c:2086)
>    __sys_sendto (net/socket.c:2283)
>
> In the opposite case, DATA listed and I-DATA not, the chunks carry a
> key but no AUTH, and room for an AUTH chunk is reserved for nothing.
>
> Ask about the chunk type that will actually be built.
>
> Fixes: 0c3f6f655487 ("sctp: implement make_datafrag for sctp_stream_inter=
leave")
> Reported-by: Sashiko AI review <netdev-bot+sashiko@kernel.org>
> Closes: https://lore.kernel.org/netdev/179540440300.3135.8565987128928534=
228@kernel.org/
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
> The Sashiko review of our earlier SCTP report pointed this out. We
> reproduced it with a test that enables AUTH and interleaving on both
> ends of a loopback association and has the listener ask for AUTH on
> I-DATA only: the first send() oopses. The test also works as an
> unprivileged user in its own user and network namespace, where
> net.sctp.auth_enable and net.sctp.intl_enable can be set.
>
> The patch was written with LLM assistance; we reviewed and tested it.
> With it, the test runs clean.
>
>  net/sctp/chunk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/sctp/chunk.c b/net/sctp/chunk.c
> index 5b889e89e9f2..0ed251421cda 100644
> --- a/net/sctp/chunk.c
> +++ b/net/sctp/chunk.c
> @@ -183,7 +183,8 @@ struct sctp_datamsg *sctp_datamsg_from_user(struct sc=
tp_association *asoc,
>          * we need to account for bundling of the AUTH chunks along with
>          * DATA.
>          */
> -       if (sctp_auth_send_cid(SCTP_CID_DATA, asoc)) {
> +       if (sctp_auth_send_cid(asoc->peer.intl_capable ? SCTP_CID_I_DATA =
:
> +                                                        SCTP_CID_DATA, a=
soc)) {
>                 const struct sctp_hmac *hmac_desc =3D
>                         sctp_auth_asoc_get_hmac(asoc);
>
> --
> 2.43.0
>

Acked-by: Xin Long <lucien.xin@gmail.com>
