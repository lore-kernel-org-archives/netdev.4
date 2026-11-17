Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794880762;
	b=W+hh4PmBTQJXEeSxTOI6GxRvSW8jFEwM2ZzRf3BXabkM8qPuV8VgUqr2rWRVWTyR+nWO
	 qxl5a6u9VdfP/Fc9SFiL/6APl92rDxu9f8464fK9uHpaLDk3hmkgu7cCtjRKfuMN+Z/fH
	 P5kWvEhxV2srxLFUaqjtGk2CQgvfMBo45EZemo92k9YSXHjaG1/ZZcQbOstlm4FfQjc4k
	 6nVT+jktCzubwJgAbwp6mY6DFKGqtAkx9ujXSk2XPHCvdQNdj7/1GBI4jo2YQUiqiCYKV
	 8NoCDn61LCynwOJtlhknvi8ZXP1A7jeUId7qirfcoKYxWRRAVBb5zPOh1Lp1LiaOaKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=88J4YdBdkt+GoqrMDEy8FKRRTjOaDrfPJo+wbtg/xiw=;
	b=I6FTHaPLEIUY9CneSTKKEU2+/osH345PjYOEVD8QC0rP6FwZqbLojIgDNcSDhUMj2PZP
	 eO2EaE+6ydZypUxsI+z3+60x/Uv2E+mOqVpr1JJaaXlZGvyvz/laK4DCpUiig24VCA+DG
	 bnAsW6xkxbhLAXBoUj4izJ26yIDZDpuvBZtXGqwu8P8ma1d3y/E1t6gtAEeSbSRk072Ij
	 ja1lAl65Rsds9+N+Atta/UfmvTirkbjFVkyBOtx0LNPYPHCaZS7R3GJjsG1nThceDGx5T
	 zOEn3Z4VaQTXjJ13cvMBADS5ZJonG+n9ey5f3qiX7Q7k98bKQbiVx+wbFkTHDdjl/7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7gWSw78;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3EB606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3EB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7gWSw78
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a594d313a3so2954726b3a.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 17:59:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794880761; cv=none;
        d=google.com; s=arc-20260327;
        b=OitEOAcho5VhzXtScsjXejl3kNMzSuM/fK52XSE4+MYFUvQVwt/Q4ikXvimqaDjxXA
         MIle51andP2AxJVF3ru6H8USsdm2/xZL5xEcIKdhMD7xCPXxazAJkP4TnSDapXs0NgNF
         NNhLgnEaL8BLFWctFY8idppwVMAhRbr5LyqQXvkLJnqCUsxEAFc/s0i2ZYDZ1zSHm41i
         sbGQn2YprKeqKO9T2wgXFWze++A95Md2LUe8VOqXZ9oj7FUbJD62qDhvRam9DLvHYVGS
         lFW8disscQ6dgL7KmC+JSZYeVxYDmYwTKU7iMvXTfzmVofKplLSWUt0RyVFVnbOBXr7B
         stlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=88J4YdBdkt+GoqrMDEy8FKRRTjOaDrfPJo+wbtg/xiw=;
        fh=4llzJgpoPA5jfHFG9XVrNky9MklMSxiwE7sWmmu2BL4=;
        b=s0RYr5wtT32IUYf8qkMmJWyM+491R7IB0ByTD614Or/bXwYiFZpt2udh0BaC4isr5R
         BUzBKMNOkmx2wNyjHxmFzWF4hJAVaH0nL03ThAN7jboPUx4xJdDtz/Gudv6TetglLarx
         ex8+JZabeEuyfAV+/BbIxL97mxlHl0wkdEVf4Cu73X2hsigTRQeSupDQLupWkxeJa/qK
         6kx6SRzFgp2Ji1amYh6qmcma+L0iJuJPrpP2SPyxNlBK/hB/JmgHBSgqtc/veIJIIPZt
         +DVYCquTVpOAPhm+BT+LEuMKAq49Tc3eLwGlXGJ8x1EzD+xbF28X30XGUAlY7N36tnNb
         AQ6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794880761; x=1795485561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=88J4YdBdkt+GoqrMDEy8FKRRTjOaDrfPJo+wbtg/xiw=;
        b=T7gWSw78lGMzFYCcz7Czk6YfLjZVacf7Cc+TvBjANCCGpZ/+aEKwvBjqoue9GeweJo
         LfMSO5A9vfIsEkqHuzLUwTJUn2q7otmbgUah6yJQPq+5r+NuK+0tmO+lH864d1/ZO/eL
         57Xyjxb5lUDuH8L8zZsRpVU+WXmPKvVbVs9m2GTiF/0XtLT194isM+ehQdKw51a+uikk
         Wl3S2LzIKC6gx9d+kgCAaD3wGeJDD882teGGM4MXagOWGwOMFBniGsnAIs6BE5XxQA3T
         9l3jIQce+buFjDrK6G/Na4yj2WFAQWcIdZHB5I4jEejiukH47tfc9w0nA+2Ivb1pSCQN
         JmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794880761; x=1795485561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88J4YdBdkt+GoqrMDEy8FKRRTjOaDrfPJo+wbtg/xiw=;
        b=psIxjKbcP2ZT92RWG8VYFBIfPzETrTEI69lG3iqtmPD8+3zv9x8qIh41LBY4ipfWYd
         BDco/m7Ja5ofBVcy73TV5s4SD7bVzQp7VfSno0WjrtJvFSm90HYomy2WQa4eas2yT6nY
         9yyprWIPVRmvea1Gw1ma01Y7nKyQ55vl8FNbbWRQ/oqg6twsSiXN8pybYPhQ/b2GXdnO
         yilXDoC8rSXjcwElv5/qWKKuSSYFCF8dX/77wDvLk9cnbzY0EPDgPzzPbWiB4GBMNqQD
         pcW626JjbO1s5tX3rVNe1bga+lht55ZxdHb807Sk0JuRV8DdEYwLhEndqGaMZfI+s0wi
         Qusw==
X-Forwarded-Encrypted: i=1; AL+hErHOtmORfxnuRIu3H72U6svfNsR2GTvV7N/LiK0Udg5wrMs2hAA+oXonBl6gLSTHbNRFMDm/fQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/RLlJNfqfKZhW/tzAt6D6bKYgal92M22vaxdmBXKcOXsuMGkT
	YIqa8byPlRb4rRoWTuq44/MERcTVry9MLfWmGeSnx16dJ8+2kD4jAHDwaNcp2V19hE6YE7N3H7i
	a3xcaY+C8jaE8IqupXAB9ylCJ7vW7DpI=
X-Gm-Gg: AYBFou3+Ioz0qznXVi/N3b4zFEC4zIb0lZaTiSvqt7UqFnTW6TM9Xb0pKdgWoVRSV/b
	mN/DD3qzoDl8PnlRpVFgWOqe7cGn7UQHrXNtQfNZfJzcjMlShOC3F12DJKibaWo/3rvfI6LFFil
	/1Mn4drBpZdn0SWPcRkTDCL4Jlg2N6+eqdhB9Ud8DEofPvlEZC8sH4d9SF3geK5fX1aaiZLrv7z
	pk6KHkv/FuIFsCEgB9jAha1hgcTqGm7spt4X4s1QeJQncB+UgRrfE97cPhk1j2/Y+iTj1edMwWg
	wlwbQKCKiYjgxlU3hH/A8G6iQoJqI0oPDW9V3F77pnKnMBa7cDB2rYFZywcyIJrAHYd+jAeQx7d
	hIYode3lSCAjhiqIRo8fhNq62gRXlZS9UiM+gM0y1Lys5zvYenGaPLoFh9NywbDBTbvlKakr6W0
	QxWFMmub1inJ/8/F5TrUkmETTsncQuyb2FkA==
X-Received: by 2002:a05:6a00:1a8f:b0:899:21db:3f6c with SMTP id
 d2e1a72fcca58-8beb21cb506mr11014368b3a.1.1794880760919; Mon, 16 Nov 2026
 17:59:20 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112092114.12458-1-ljp1205831794@gmail.com> <179482095589.3136.2362257339716532422@kernel.org>
In-Reply-To: <179482095589.3136.2362257339716532422@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 16 Nov 2026 20:59:09 -0500
X-Gm-Features: AclHuK_War1T5zrgB_Ouw4Ktq31IpAlp_uIzGk8Kbj4QLzA7noWfu4odgJ7Twvk
Message-ID: <CADvbK_diB=3u2mdX9NkeCW8h8NJPpsO2nfufP4+gvS=tCm9DOw@mail.gmail.com>
Subject: Re: [PATCH net] sctp: preserve the last transport during INIT error cleanup
To: netdev-bot+sashiko@kernel.org
Cc: ljp1205831794@gmail.com, netdev@vger.kernel.org, jiapenglin@tencent.com, 
	marcelo.leitner@gmail.com, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	vladislav.yasevich@hp.com, linux-sctp@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 4:22=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] When cleanup fails, the new `!list_is_singular()` guard in
>   sctp_process_init() (net/sctp/sm_make_chunk.c) keeps whichever non-=E2=
=80=A6
> - [Low] The commit message says "The retained transport is freed when the
>   association is destroyed", which suggests the kept non-ACTIVE=E2=80=A6
> - [Low] The comment at the clean_up label of sctp_process_init()
>   (net/sctp/sm_make_chunk.c) still reads "/* Release the transport=E2=80=
=A6
>
> --
>
> sctp: preserve the last transport during INIT error cleanup
>
> This patch changes the clean_up path of sctp_process_init() so that the
> loop removing non-ACTIVE peer transports always keeps the last one. That
> stops sctp_assoc_rm_peer() from using the empty list head as the
> replacement transport and crashing in sctp_assoc_set_primary().
>
> > Keep the last transport during cleanup so sctp_assoc_rm_peer() has a
> > valid replacement. The retained transport is freed when the association
> > is destroyed.
>
> [Severity: Low]
> Is this description accurate for the path in the oops trace above?
>
> The trace shows sctp_do_sm()->sctp_process_init() with no sctp_sf_*
> frame. That is the SCTP_CMD_PEER_INIT path through sctp_cmd_process_init(=
).
> The sm_statefuns.c callers pass a new or temporary association and free i=
t
> on failure. This caller instead runs on the live COOKIE_WAIT association:
>
> net/sctp/sm_sideeffect.c:sctp_cmd_process_init() {
>     ...
>         if (!sctp_process_init(asoc, chunk, sctp_source(chunk), peer_init=
, gfp))
>                 error =3D -ENOMEM;
>     ...
> }
>
> In sctp_sf_do_5_1C_ack(), SCTP_CMD_PEER_INIT is queued before the
> TIMER_STOP(T1_INIT) and NEW_STATE(COOKIE_ECHOED) commands. Those commands
> are dropped when the interpreter bails out. The association stays in
> COOKIE_WAIT with T1-init armed, and primary_path, active_path and
> retran_path all point at the retained non-ACTIVE transport. Later T1-init
> retransmissions use that transport.
>
> Before this patch, every transport left after a failed sctp_process_init(=
)
> was ACTIVE.
>
> Could the commit message describe this new state, where a live associatio=
n
> keeps running on a single non-ACTIVE transport?
>
> > diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
> > index 15c2d87575a8a..e4b7dacf174e6 100644
> > --- a/net/sctp/sm_make_chunk.c
> > +++ b/net/sctp/sm_make_chunk.c
> > @@ -2528,7 +2528,8 @@ int sctp_process_init(struct sctp_association *as=
oc, struct sctp_chunk *chunk,
> >       /* Release the transport structures. */
>
> [Severity: Low]
> This isn't a bug, but the comment no longer matches the loop, which now
> keeps the last transport on purpose, whatever its state.
>
> Could the comment say that one transport has to remain because
> sctp_assoc_rm_peer() takes the first list entry as the replacement path?
> Without that, the list_is_singular() check could later look redundant.
>
> >       list_for_each_safe(pos, temp, &asoc->peer.transport_addr_list) {
> >               transport =3D list_entry(pos, struct sctp_transport, tran=
sports);
> > -             if (transport->state !=3D SCTP_ACTIVE)
> > +             if (transport->state !=3D SCTP_ACTIVE &&
> > +                 !list_is_singular(&asoc->peer.transport_addr_list))
> >                       sctp_assoc_rm_peer(asoc, transport);
>
> [Severity: Medium]
> Does this keep the right transport? The guard keeps whichever non-ACTIVE
> transport the walk reaches last, which is the tail of
> asoc->peer.transport_addr_list. That is not necessarily the transport for
> peer_addr, the address the INIT-ACK came from.
>
> For an existing peer, sctp_assoc_add_peer() only promotes SCTP_UNKNOWN:
>
> net/sctp/associola.c:sctp_assoc_add_peer() {
>     ...
>                 if (peer->state =3D=3D SCTP_UNKNOWN) {
>                         peer->state =3D SCTP_ACTIVE;
>                 }
>                 return peer;
>     ...
> }
>
> New transports are appended with list_add_tail_rcu(), and
> sctp_process_param() adds the INIT-ACK address parameters as
> SCTP_UNCONFIRMED.
>
> Consider this sequence:
>
> 1. The peer_addr transport X is UNCONFIRMED and is primary. This can
>    happen through sctp_setsockopt_primary_addr() or through an INIT-ACK
>    SET_PRIMARY parameter. A Stale Cookie error then runs
>    sctp_cmd_del_non_primary(), which leaves only X and returns the
>    association to COOKIE_WAIT.
>
> 2. A new INIT-ACK from X carries address parameters Y1 and Y2, which are
>    appended as UNCONFIRMED. The list is now [X, Y1, Y2].
>
> 3. The packet reaches clean_up. One way is an address that collides with
>    a transport of another association on the endpoint, so
>    sctp_hash_transport() returns -EEXIST. Another is the ADD-IP without
>    AUTH check.
>
> The loop then removes X (primary moves to Y1), then Y1 (paths move to Y2)=
,
> and keeps Y2. Y2 is an unverified address from the INIT-ACK that was just
> rejected.
>
> sctp_assoc_rm_peer() has set init_last_sent_to to NULL, so when T1-init
> fires:
>
> net/sctp/sm_sideeffect.c:sctp_cmd_interpreter() {
>     ...
>                 case SCTP_CMD_INIT_CHOOSE_TRANSPORT:
>                         chunk =3D cmd->obj.chunk;
>                         t =3D sctp_assoc_choose_alter_transport(asoc,
>                                                 asoc->init_last_sent_to);
>                         asoc->init_last_sent_to =3D t;
>                         chunk->transport =3D t;
>                         t->init_sent_count++;
>                         /* Set the new transport as primary */
>                         sctp_assoc_set_primary(asoc, t);
>     ...
> }
>
> INITs go to Y2 and Y2 becomes primary. Y2 also stays hashed in
> sctp_transport_hashtable, so packets from it still match this association=
.
> If X had been ACTIVE, X would have been kept and Y1 and Y2 removed instea=
d.
>
> Would it be more deterministic to keep the transport returned by the firs=
t
> sctp_assoc_add_peer(asoc, peer_addr, ...) call, or the current
> primary_path?

Please try to fix it by using a check like:

  !sctp_cmp_addr_exact(&transport->ipaddr, peer_addr)

instead of

  !list_is_singular(&asoc->peer.transport_addr_list)

Thanks.

pw-bot: cr

>
> >       }
> >
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261112092114.12458-1-ljp1205831794%40gmail.com
