Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003978;
	b=CwW0beccP3c1BOvCXCCRLh49Z5isdkdNNfPe8s1yRZwdOVxldcxBrqxu0swwxY3ZGejA
	 HPh1PbYYAMC/h2tJoUo1bM6kH64woMmS1Jwa5uTJvS2qBT/njHD2Un31fx3aC+x98+UpU
	 JW3qWp3b/GPg53MMjUIg6IYtsn2KQSqCrQaf/1C+ugq8c2ZvXhmXToLjl2pUag2V4vbQC
	 WuhCt+sMOm+K7gQsRwWMpkp76hoi1U2KTSAd41E5Lk8AUeQb3U9JLxqUxk8sy/q+KIBHK
	 Xcf8OqFiGqSyCyBGAHpliJflGbqox92KrBiEjveCcOwXLq+X/6+RrdOMwd21CA6zPGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003978;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o6NkUixIaGIxhWVtX5vLgTJsl5Rt9R4mlOjq/LvWRRU=;
	b=XrKX8KzgLJm/Dfv+/RYZKlKk6JK3QBvjBShPScG7cuE4wFT5nyFac7wuTyuuaPluEmay
	 pQNRSugQZK5t9S1b1VJcTD10KmwiYlBZYjQFx5SPu7o2PWcS+3kr/2v/MV2tRdwNSMfZ6
	 kmex0pdJJMPuTVScXVvY3nx6ex+iD1WPRYNg0hBEGI+ksbOxNL7+KsORIg5Zb3uKrzs2z
	 MxItS7WHdEX6lpYYmIaA8OdSrB3ZEhPgWos7VwPepO1nF3p8ygrjLLqKaKb40fxIDC5Uc
	 3buozoWNZWSvUc6Og6tbBWSLMHGMcLpbFdnl7IZtZId5t8RL22xtRgsOC9OsqKgxTQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DNYQIi4k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154F8606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DNYQIi4k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65B81F000C6
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003977;
	bh=o6NkUixIaGIxhWVtX5vLgTJsl5Rt9R4mlOjq/LvWRRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DNYQIi4kPqDgK3BJL8BQkHE1hN7kKYWgIOTohmEDmhhloQACdNKkJMT2PvJv0THGy
	 FRKQmh2n4s25WOPOiGELPIkhvpQNiA4oKMP3tFagKXe80bJRzDfkWzcLdjM3cjLO1C
	 X2vdo4t38OyzqqUxdwFqPXHu0vZ/5zVzIKp1VYjW7je8iVBi8/xuS24SP61LOaw3cV
	 BrndyT8YaRL/8cVpW08kHNblEvJW7gJZjRa6cJ2Fj7mHnzArZRgB4AdlNqrgTdY/gv
	 vtWpB+oE3XxyDV8tmutClLnvN50taKsj2Yk+l6pA+ZikN1Duv6nEo6cCKaqQAK1LnZ
	 a/pa9RgqHJkdg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71ad1db7e31so1321258eaf.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 04:12:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGdeNgBSfjm4DBuffEsTF6KxqtWS0IiErRT8riMKcUFZeaSkDVjfa0k50Pdncl8EdAirbK8tFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4B1ODjixmtn/i0K5C9AmPnV+XtK/k3AZ/nZ8UC6AsGFu5wuNm
	d7l1CppjhFWfi8zuqwMtEyk8+T1wrz5unAGUrILu6+TzRBg9KTKy8Wl5OK6Xskn0yuqmILK959v
	yfy6TF3W7riK30fbciNmhWNH9aor4jFc=
X-Received: by 2002:a05:6820:1907:b0:6d9:4131:5035 with SMTP id
 006d021491bc7-71b02944507mr3515423eaf.43.1795003977008; Wed, 18 Nov 2026
 04:12:57 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179499954853.1440581.6627074959099619480@gmail.com>
In-Reply-To: <179499954853.1440581.6627074959099619480@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 13:12:45 +0100
X-Gmail-Original-Message-ID: <CAL4WiiouZZ46QRp5K6MYK=vevKXYLzd_p049qVVf=w+9L8d96Q@mail.gmail.com>
X-Gm-Features: AclHuK-hXcrZxctniMtIHyC9pOLLCSZJDsVh-XhX04k9Pj10EP6n6DQMf1hKW4o
Message-ID: <CAL4WiiouZZ46QRp5K6MYK=vevKXYLzd_p049qVVf=w+9L8d96Q@mail.gmail.com>
Subject: Re: [BUG] tcp: shift-out-of-bounds in inet_csk_rto_backoff() for an
 orphaned zero-window probe
To: Kyuwon Cho <kyuwoncho18@gmail.com>, Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Cambda Zhu <cambda@linux.alibaba.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 11:59, Kyuwon Cho <kyuwoncho18@gmail.com> a =C3=
=A9crit :
>
> Hi Eric, Neal,
>
> While testing v7.4-rc3 with an LLM-guided test generator that we are
> developing as a research prototype, we found that an orphaned socket
> that keeps sending zero-window probes makes inet_csk_rto_backoff()
> shift by 64 or more. An unprivileged user can set this up in its own
> user and network namespace:

Thanks for the report and the reproducer.

This is a known issue, a fix is under review:

[PATCH net v2 2/2] tcp: fix shift-out-of-bounds in inet_csk_rto_backoff()
https://lore.kernel.org/netdev/20261026123244.239766-2-jiayuan.chen@linux.d=
ev/

It limits the shift to 32 in inet_csk_rto_backoff() itself, so it
covers both callers: tcp_ld_RTO_revert(), which is where Jiayuan hit
the splat, and the orphan check in tcp_probe_timer() from your report.

> We found no earlier report of this call site.

Searching lore for the function name would have found it:

https://lore.kernel.org/netdev/?q=3Dinet_csk_rto_backoff

Please do this before sending a report, especially for findings
coming from automated tools.

Note that the netns sysctls are not needed. tcp_retransmit_timer()
increments icsk_backoff without any limit, so TCP_USER_TIMEOUT and
TCP_RTO_MAX_MS on a socket with a silent peer are enough to get
icsk_backoff above 63, then an ICMP unreachable reaches the shift
from tcp_ld_RTO_revert().

> On x86 the shift count is masked, so from 64 on alive can come out true
> again and the orphan keeps probing instead of being aborted.

Right, and this starts before 64: with icsk_rto =3D=3D 200, the u64
is already zero when icsk_backoff reaches 61.

Jiayuan, I have not seen a v3 addressing Neal's feedback.

When you send it, could you please add:

Reported-by: Kyuwon Cho <kyuwoncho18@gmail.com>
Closes: https://lore.kernel.org/netdev/179499954853.1440581.662707495909961=
9480@gmail.com/

and mention the zero window probe path in the changelog ?

Kyuwon, it would be nice if you could test Jiayuan's patch with your
reproducer and send a Tested-by: tag in that thread.

Thanks.
