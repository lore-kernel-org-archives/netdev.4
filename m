Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670693;
	b=xkoKeMulzUvdTxCbp6UATlu34Je+d0ksXOIr00geT9OYlch0sesUvxvNL0sKRPuof/gm
	 AwOm7Chnnj4ArmfTlaQwD0YWphI9Sa5RiaE8gUvwC6xnFHEf7jD9kEhd54mMkFwsWm1Ad
	 0VvwfN4vv012S3IWh+YJBALptNx/Y8ovM5/IwKmyDG9E9/VFIf7iWTu5KSZlJZJYNONf4
	 Mb5lU1sLoKRiwqb25gOmvqGTVX4xsUXTiD+CL4sjeKLSgwUlh6Tz1S8rEj83ao77htm00
	 Jh1HByP2toheRrh5QJlo9/8lqZAc9dTpG9yUk0TbaBVNSq/FpRqyZ4JmS7Zda3JeuoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670693;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lZLJy6bzNUWfLiwfp/OHIdREPsKJ7Su3AkHPHH7wh/8=;
	b=YbUx/7HXR0ZPmhtg92AXO6Qixlm0Ya+nuFvRBlf2VCcCXv1sYdjLsO3zLvBTMySpNxDt
	 uG0BW3jgg/U0aQ3fMApm3kDSv6Kg9pYPWcGseHHTnEYo/Xq9VY3ioDewTDpsphy5CYtWc
	 mYU5EKCJ06ptvmCKn139b/0lAoFSnIkQnjy1zx8/VwgJMjCUdKkTuSkK9+lre4m7kdBO3
	 sE4t0tggNXCmQfN6raD6SVsGlQ7CUe16ikbXg5ZGv/vS9cm8ktwcyDRPJ3ZrPHdRas8/e
	 YqHqxNWCgtrcXaxYzixB9T8hblUH1jeAuNg4m3W1RO6j47DQtn5ZBuASoWexFtehfNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J14Na+tt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5BE606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J14Na+tt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837601F000C6
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670692;
	bh=lZLJy6bzNUWfLiwfp/OHIdREPsKJ7Su3AkHPHH7wh/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J14Na+ttPobaKmHX9bYSE41A7sQBsSPeDsYJoirRsm27ASs3BRvMfQd+Ofyr3nBGo
	 B4UZRiG9JLDlO1N5QrNqPdDUKsO4S4QEoZz+vDCRQbiuEXVkb95XYtaPCYgn2BJ9VU
	 QfKZjQEQ9OYgFVFScUCpGfSca9wUPm55nwUwYOzvPH8i9GnpMJUcZKVT2NGTil4OV5
	 vHoUukHrOpanAOlF23AJ0jxQjUT2ieK1J9DpD9MNsnxNtG0onXqTpRuWnbVt41uwBR
	 A2ISSk5ww8bCsa6qryqkVzTn7m8RxnUKbMVu1xo7/PU6DNQv9lJ3QiDMSGMJILen1D
	 Viqt8ENpabIKA==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ad2c6491fso278484eaf.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:38:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEXfsr7q3PGUI8O5KgCqDul/O/WAV3dKzD6MgM+uys68hLleEa3kdY/xxeJiBO0aIb4ctjUnr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z95mgkm2Izw7Feq7I7raZaWho8O5INieSkpC2yvc6BlO2Vt1xsS
	9xFO3L8VymSUKJviiEZDi/dz9bo45LP3HsXm2o0bCqmbVvVbAvmfGtYo1xX8UcWwIPw24lbMPtI
	b+FDhfAx984Y2U/nAYK5RKmNGJ7GK5h4=
X-Received: by 2002:a05:6820:60c:b0:70e:177b:eafd with SMTP id
 006d021491bc7-71ab5086aa7mr2905723eaf.16.1794670691913; Sat, 14 Nov 2026
 07:38:11 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com> <20261114040101.1043546-8-kuniyu@google.com>
In-Reply-To: <20261114040101.1043546-8-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 16:38:00 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqY-8011r9W_mGk1ZRZhmO2ac58s0ZiHEtKDyMzYrd1zg@mail.gmail.com>
X-Gm-Features: AclHuK_0vQH_kcXOb_-kASCC9WUkmMpDMZVq3vl7tNG4sb5I7vb4f70hvWqu3eQ
Message-ID: <CAL4WiiqY-8011r9W_mGk1ZRZhmO2ac58s0ZiHEtKDyMzYrd1zg@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 7/8] tcp: Batch memory accounting in tcp_collapse().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> Once tcp_collapse_one() calls sock_rfree(), skb->truesize is
> reclaimed to sk->sk_forward_alloc by sk_mem_uncharge().
>
> However, sk_mem_uncharge() rounds down sk->sk_forward_alloc
> immediately once it reaches 4K since commit 4890b686f408 ("net:
> keep sk->sk_forward_alloc as small as possible").
>
> This unnecessarily reclaims memory for newly allocated skbs,
> and the following skb_set_owner_r() for them underflows
> sk->sk_forward_alloc without sk_forced_mem_schedule().
>
> Let's cache the delta during tcp_collapse() and batch accounting
> at the end.
>
> Then, we no longer need sk_forced_mem_schedule(), and instead
> DEBUG_NET_WARN_ON_ONCE() is added to catch a future issue.
>
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
