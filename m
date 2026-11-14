Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670657;
	b=QxeCKK7+toWsBKPZIm/2QfLG7FlyNY0NhxqiI6ohWZnMARbMSmfKWyGrE6imn8uqansr
	 Ennk4xlLu+R+/E+Llvu/CiU6jx2b1Z1FmJAyDXp137dAesLooQkDFWJ5syn2kBToPBNoZ
	 N14WJVQPNA6o7crdnKo0GMEJJm2t/HgIKZfH1JR7CdasNPpViu08Pj6eqA1yexuZqnF2t
	 SKK3+wLpQhiDrh9sIQ+9WITJZjSb4pS+VtiCOkzvkvZFMVC0Hk5QLNsnno/r8kBlPnsd3
	 cGbvH6C0g3/70nnEJTQZEYf01CMUwjhzL0D5oQ77lR2MOwUlalvQlC5ejRqKWW78kHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670657;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TVGBjf0ZFblO89VfjuR1hy/9Uswtc0sHiH5xUhMMnMQ=;
	b=NY9Qr33hUOCrBl+ojXnnOMbJmkCz5V8sAXwHTcmk3ULc9XmTpqphwqsVHmI6/LSQcgb0
	 WpIyS8B9Kftpk/fiZic7GLXPgessFf0hqfhkD2wiDuKSPfPz0WdSMLbIQChzXIeP7QZ6W
	 2nVN4fn8kgc7N167fztFMyJgDGAtEzKM3XbteseDkuKuYyCO/6bwidEN7TzAwc4u0I4PH
	 aC1Py9fXIr2YTOn/CdquzLZTHwOw7ULXzTRjY/f+P/1jIFekLaj2NvfFmguQiKGgQvBsm
	 sjhcAe+vDAMU5gO+SGKMjjGt6xwCIpxFptmxkCy3nhdlafgB/sTDsc8B5hxRjuuRt6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lwhcyU0y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCACA606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lwhcyU0y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5881F000CB
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670657;
	bh=TVGBjf0ZFblO89VfjuR1hy/9Uswtc0sHiH5xUhMMnMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lwhcyU0y6n7Z2lrCcOZGbYHqJpT6TD3//sjZCwX0fA51uoFR6XWM8ba1m8BVPZy/I
	 dH7RmdRMTVB4mwrRX+UWQL5yqoFq+LQBaeV4RAKp7G+6+LcJRCnAVCzhF0ZirktShV
	 BxfaxaPVZp1IEmZqHjvLrUFGm4fgT8IKa8XjLrZuKVN0RtVFi2kNy+msU5/Hk9WFT4
	 sUhyiGvQDXzV4ioXW8ed5qF8elpbIAM3irkY6A9fkCDKTkGzXj9LdFMQ/D0d4k1VjG
	 m+tfLuEimkAXkrq2fv58J7t/JhjM41yHE0bU63/OE59ESajntNqveI2Uvx/3EbFMu7
	 213ZVXs5n1kgA==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4ad587ba293so2004684fac.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:37:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGnenXYTtA8u/zg5UVCjMddbqzk03iYWVvwKnaGO7+KgCawOB44w7QShlHDGa33pe6+UF5jF54=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3ydlmv7rEgCW+OoqPVAFR4wz7yO1aIlVAhzGKNhnEtGz3WP53
	M5ryRUEVX5IFY7SHAYwYSFEHR/YKFZDhwHPAwoDPKWUDh4Dj45/CAzCTx0sVFSyJSco1VKwmnD0
	GSTyxf41+Zfe/4dy6T9fNfAxeixGQins=
X-Received: by 2002:a05:6870:3d93:b0:485:d31b:7768 with SMTP id
 586e51a60fabf-4afdf449eb6mr5504282fac.38.1794670656731; Sat, 14 Nov 2026
 07:37:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com> <20261114040101.1043546-7-kuniyu@google.com>
In-Reply-To: <20261114040101.1043546-7-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 16:37:25 +0100
X-Gmail-Original-Message-ID: <CAL4WiioP8jdBJjKKBV98spcaoAB9FAsh_UsPzkCn53JYhphx9g@mail.gmail.com>
X-Gm-Features: AclHuK95dYFNK3Ztxi6Qd0c673I4A0T6dTKtF71tomm8MFSr2o-a3UDJ-7XG9eY
Message-ID: <CAL4WiioP8jdBJjKKBV98spcaoAB9FAsh_UsPzkCn53JYhphx9g@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 6/8] tcp: Allocate all new skb before collapsing.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> At the final stage, tcp_collapse() iterates over collapsible
> candidate skbs and repacks them to new skbs.
>
> In each iteration, a new skb is allocated and inserted to the
> receive queue or a temporary list for RB tree.
>
> If alloc_skb() fails while splitting a large bloated skb across
> multiple new skbs, the partially-copied skb is not removed and
> new skbs remain in the queue as duplicates, consuming more memory.
>
> It is only when all candidates are properly collapsed that
> we can save memory.
>
> To avoid complicated rollback, let's preallocate skbs before
> collapsing.
>
> Now all skb in [start, sub_end) must be allocated in a batch,
> so the section size is normally capped at TCP_COLLAPSE_MAX_TOTAL_SIZE
> (16 skbs), except when a single bloated skb or overlapping OOO skbs
> must be collapsed together to free the original skb or keep the
> rbtree monotonic.
>
> Once the size exceeds the limit, the remaining skbs are re-evaluated
> from restart:.
>
> Note that the next skb can be skipped if its density already meets
> tp->scaling_ratio, and each cut adds at most one remainder skb
> (~3.4% worst-case truesize overhead on 4 KiB pages), which is a
> small tradeoff to bound the temporary allocation.
>
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
