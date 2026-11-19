Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113717;
	b=V3ieWGZlIb/qJdAY8lPQYMou34ovLPB6yb5yqQWMNztPekjnLXJv+BbJd7RBQopumDWY
	 2H6LD+sScvwRo7ama3tvRHedqSN09RaXrDrxS9XMRi8+43D8QAm0DyapCBc2mh+goh3KH
	 rgtD5PWRzt1+E8oCl8vGELPZis0NqeGogXmPupVDYY2e3zX1Xk9SiBW2Qk8HY5spkimu5
	 kGDVLh3bu4GmdIr5fqYHt0A2MAll7vbYzxak3/0/lrgyluq/1Tm/3QN4M2F3/b95nwQnS
	 qwbhpIMAaI1j+Aq227WgvDLiN3Nsi44Tn+MvFW1FZtwO5OdZZlRelbwhhSU9n8/jFhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113717;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ef6m2NmXuoN8B+zj6ZlcXVdQYuVjSXsN1Go4Wl9InqY=;
	b=vyTm8CkpAqKRuWVKiCzhIk+tZE4EFUwcjUOlZRc0uLOxfezGA5z5mZkcp/RZSHaNpfPB
	 esE/eoxHhwdnKgLRsatnHym89+BoG/8i/d85z6j2d2YojXhqbafxrIPAnr3QIC4pKHrB2
	 vKIBhm3aAJciOFeLxO4uhWNWWyf39aYI9JXMomeR48QvfQYGyBJMpngd45ApkzjFsU6W5
	 /5heU8q98P+9KOuNcr67fisP7fCcG7AXXakyZGvWyyi7z+0n7cenFOhJGxEYEgnrn5p3t
	 vZHRLuz5IzIrP/gtgDhqgbXOJZpwxNwoNh+qMkQ7PmLxWFnkfzuyM8uIlJ9WrX4rU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGmBsXVq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80178606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGmBsXVq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B97C1F000C9
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795113717;
	bh=Ef6m2NmXuoN8B+zj6ZlcXVdQYuVjSXsN1Go4Wl9InqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lGmBsXVqc8N451x920V9aiRw4ttXg92AWJpYBN7bVKlmi5+I8OtmWFsk53CpCKTya
	 j8UqPPxblH38B3HNkqI9plOpHePyEW/GSVYQA0pdPRTFyvYj2KBm8BZs+Rfy+nJAbL
	 +Xv1ZnfDlESDyldR9tHuNLXWp94XQTR6GboaERJ8NvzHrXtvVpKKxQQ/UyZBD/+Xiq
	 fY+x2awqlziywOPftzPOFoousvkams6cD597UcXb8IaqXmwSSPlfGvFJcEZOUczFFS
	 4xMSo+Mlw8kuHEFiwW306QqE03QqX28ql7MTCoFvi2byhGJcd2QHt72SL3l8DTSACl
	 0J43DJyvU3O2w==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71aea92f666so32859eaf.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:41:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFEQlExB4j20jFnZkeklhfwr4akLD+6agIyVY/i2+dyuwrrbi3A+XgRlCTXDVS7zN71V9qb4Gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PnFjm23JqgLeIwr660chRDWR1vXh1hMuwT6z+Qj2bBEg2fE3F
	1CzR8PwmCdtF38CULiLNS1gnBXHpGBS15eVqf+MhV47W9VWN2RFBJcaUSfN62+cxITrSJdiEpc+
	GxnQ0H7uxqIw4W0EZm1ovqE3WQAzlNFM=
X-Received: by 2002:a05:6820:1686:b0:713:9556:56b with SMTP id
 006d021491bc7-71b39291ae6mr548725eaf.6.1795113716282; Thu, 19 Nov 2026
 10:41:56 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 19:41:43 +0100
X-Gmail-Original-Message-ID: <CAL4WiipvtvgLbWk7TmLe_O08Bw7GeHK-C4Zengin6QgpdqTVTw@mail.gmail.com>
X-Gm-Features: AclHuK-O_0hz__GFcg0N35N_TvxPji7Xriol3sP2aoslRjCyZUMPvUHSw0P4mUo
Message-ID: <CAL4WiipvtvgLbWk7TmLe_O08Bw7GeHK-C4Zengin6QgpdqTVTw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] TCP Prague preparation series
To: chia-yu.chang@nokia-bell-labs.com
Cc: linux-kernel@vger.kernel.org, kuba@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, davem@davemloft.net, kuniyu@google.com, ij@kernel.org, 
	ncardwell@google.com, koen0607@gmail.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Mike_Rudolph@comcast.com, Jeff_Howe@comcast.com, 
	srichard@netapp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 19:01, <chia-yu.chang@nokia-bell-labs.com> a =
=C3=A9crit :
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Hello,
>
> Please find the v3 TCP Prague preparation series, and TCP Prague will
> be submitted after this series.

This is v4, and I could not find what changed since v3 : all the
changelogs stop at v3.

Also, the changelogs are placed after a "--" line instead of "---",
so they would end up in the commit messages.

This series does not apply to net-next. Patch 1 fails on
net/ipv4/tcp_input.c, because it expects tcp_accecn_process() to
have a prior_bytes_acked argument. I do not see this in net-next,
net or Linus tree. What is the base of this series ?

More generally, this adds a new tcp_congestion_ops method, a new
ecn_flags bit, and two exports, without any in-tree user.
It is hard to review these in isolation. I would prefer to see them
in the same series as the congestion control module using them.

More comments on individual patches.


>
> This patch includes the following additions:
> (1) Export CE count in rate_sample as acked_sacked_ce;
> (2) Rename existing rename ECN transmit helper function;
> (3) Add TCP_ECN_SEND_ECT_1 to use ECT_1 after negotiation;
> (4) Add MSS ceiling callback for congestion control to limit MSS.
>
> Best regards,
> Chia-Yu
>
> ---
> Chia-Yu Chang (3):
>   tcp: rename ECN transmit helper function
>   tcp: add TCP_ECN_SEND_ECT_1 flag for congestion control
>   tcp: add MSS ceiling callback for congestion control
>
> Ilpo J=C3=A4rvinen (1):
>   tcp: export CE count in rate_sample
>
>  include/net/tcp.h     |  6 ++++++
>  include/net/tcp_ecn.h | 12 +++++++++---
>  net/ipv4/tcp_cong.c   |  8 +++++---
>  net/ipv4/tcp_input.c  | 40 +++++++++++++++++++---------------------
>  net/ipv4/tcp_output.c | 18 +++++++++++++++++-
>  5 files changed, 56 insertions(+), 28 deletions(-)
>
> --
> 2.34.1
>
