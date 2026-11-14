Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670377;
	b=q1dZAebTq3uKON18ne+AVkLe/2eCjg/YFOKJE51qQCMyKM3OmgPbLWUDJt0K9UGePfVI
	 8xZ9T3jrA77cLGRQJoIcIy7xiM2vsMR9QSYuIRAQkoEYLeOJXgRm3bOOw8XfsuDaEN8vW
	 QSLX2E5591UqYmT7gwxXY5Tt/3pwU6Fve4RoG90HolV3Extc3OdgXsA2OAQrXye3aeelC
	 ZyqS7ZT49fWoBrz2Dw3dadWGBRalXonAVrEYrhwjo+zpEM3TN3zV3QYxAauZMOihGRNPG
	 uaQse9JYk/cxIw63392S48v1umM64SkyiGsAHQzD3whrKpjTrKDt8bLwwdf7UdnmzdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670377;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tOdFgq6NJE5ZahFuNxVKUFHDjUOWhxrNt70ospd2l6U=;
	b=PvrgInYag2ZIyvCSvLUjPnLUTLGQaY4HPw1W15E4LeUD5f6k+omiy3a4E9Su0gY0RBrS
	 5LgERqeKEQcfUdhGry9X9Y3LA98MmBC/ziJFkXnDmz1tdPTP7H8KBSCLvnVNzTvtGA91I
	 1xwCiBuzScVZ0Xz/ZhYUtBRNE4vLZQ7DxWOoxcj/Sa8SJFWuBj7fHRCgLya3J5OwSHdGN
	 wuuiHqZevEf3/r2vfMTiQSxXB1apNGqGTf81IOKyW41CUbhZygnXjbrYeC0NK12zvAuhZ
	 RoR7AVrfmy3aHNUYBVdJPlWqqYcMRVwXSCUHG2Wd1cQ4n7oNJ5L/kTaZSHUhH4UJHGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MODdELXk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A06606A332
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MODdELXk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157A41F000C9
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670377;
	bh=tOdFgq6NJE5ZahFuNxVKUFHDjUOWhxrNt70ospd2l6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MODdELXkolKksSulE5BngSIPe4RIgVMDNSyKYElgVBsPRVci7V8bOdc42hT2iOm3y
	 23UQTi80zop/5PfAuhJHNlFJGEeOTb7a1bD6tOGXPLlkdWbAYND/0rrhvekbQyMCy1
	 UX2pwNPFK1vnpwTvwgbC7Jr8hGBicbyYUmtY7iLxk1arsMdPdVV5qumDR5h1di5xrs
	 OB9phOX9VB0fYokQszTOdJe0B3fiKgiPbEIh73UFMtP0JQSFCFmSmiMw1FpH+LiQav
	 fCxklqqRd8/9K1RqdBIAzFMJCm/J6uAu4+wPd5XuZOwN/zkG6zk2DWOTRgbj7Vhg8+
	 G0fZ7+yAdisew==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f84a55cc06so1894070a34.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:32:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH199I5Wi1nDhbpnzfmITrb9GYZTLkdMXC4Jy+pLaEoc5/zVEQUB473ujZlxoc3JK4NQJOyMyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z810KDUA6drqIfzZsL3d6+QGUzxW3qNdqt8fHS7syE+EUfQYyGp
	2F8G/dD6P0e8t+2CHBb7mIYKB3EJpkAb/49Vg6IT9YuL2efkq+7gnzB6UqN/OuV0TEjO1eOAmVf
	N9q1SqXNz41V6V9BPteaMkhP8uuyAM7Y=
X-Received: by 2002:a05:6820:2205:b0:713:e404:a96c with SMTP id
 006d021491bc7-71ab4f76653mr3292281eaf.43.1794670376429; Sat, 14 Nov 2026
 07:32:56 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com> <20261114040101.1043546-2-kuniyu@google.com>
In-Reply-To: <20261114040101.1043546-2-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 16:32:43 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiq9VH0hw0=TnDc_f5v4AMpkFpuRB4t8vNME-KzKKzy1uQ@mail.gmail.com>
X-Gm-Features: AclHuK_8xRSr4TiVruPvCxLe3Za149WO2vqfnb-l2Cr7CYIDmjFWSjCAt489d4Q
Message-ID: <CAL4Wiiq9VH0hw0=TnDc_f5v4AMpkFpuRB4t8vNME-KzKKzy1uQ@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 1/8] tcp: Clean up the first loop in tcp_collapse().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> tcp_collapse() detects skb to start collapsing from in the
> first loop.
>
> If the last skb has SYN or FIN, the condition is tested
> again after the loop.
>
> skb_frags_readable() is placed inside and outside of the
> loop as well.
>
> If we goto skip_this in both cases, we can remove the second
> tests and simply replace end_of_skbs with the inverted loop
> condition.
>
> Then, we do not need a test for tcp_collapse_one() too.
>
> Also, skb_frags_readable() should be tested after the fully
> overlapping check.
>
> Let's clean up the loop.

This is not only a cleanup.

Before this patch, when a SYN/FIN skb was overlapping with the next
skb, the loop was left with end_of_skbs =3D=3D false, and the test
following the loop made tcp_collapse() return: nothing after this skb
was collapsed.

After this patch, this skb is skipped and the following skbs are
considered.

I think the new behavior is fine, but please mention it in the
changelog.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
