Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082862;
	b=o98SdqgM/aMRh9XUUY+UAbsztsMd5XhMy5fR+aEIRlIYLCDRuaXpFyW/yPePGHvY6MBU
	 MZJB8vR9A343yhXs9sGtRHTfVM2ECf3CQ9XJ0nBnUNzrxPy+3H4roacSXTniCgYcZV2IR
	 CelCKaLpUNGpLQmMnWaRu8Mexn0SXQdePpGUX4INw4yXqR3PJm3lW3HtDDfSp07rOeXN8
	 6yLCUdmQsTohh2igC09sxktoms4F7Hastq2KfIDBFD/0FsNFkZr1FIQgbVhraKQR3lODH
	 W7ECWbigb2p9AQp7OF39Gsv4cJeFZUIiM6NKHpBeQiJX/lHLzATTy/omhYNW4iud8Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082862;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rdNNbl9xjS7fw25SeJHWSaw1USK+R4l2BVmzQBe1r44=;
	b=A/XVKBhusthzNpNp5cBdfpflpsNSqbCxI/ELhiFHMO+NUhCkAPALc5LMjK+NGP+MRLUe
	 dB2a2MJIfrKgtqf18a3A5f6bqbjBVNJ67ZsmtttuHWDZhgzjq+gHK3Mn+AiUUFBRsKYLL
	 i+DchcBF2Gfj391HrZotdFgxAhjF4fUBtIHVpNZzKVcYbtDk0+zAXvmQdPvbwm6Una1d9
	 ZDn/u0g8Dt41sOuaKjjgywOQiiO8SIfyxdl0X0gDPHn9+UGSkbRFLee0dHic2ER61/vvI
	 R9TF9gpCpAIjd/W1bzWwKX9aF/m0jDikxylWTr4biAB2JE5zqN0iI6BWqbyv95+xrug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GwHJqmL/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DED60A2603
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GwHJqmL/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F721F000D0
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082862;
	bh=rdNNbl9xjS7fw25SeJHWSaw1USK+R4l2BVmzQBe1r44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GwHJqmL/daSbnsD7Jpppugk7O7cBsMZE0ILmiEitcaran+3uPzA+t5RTOslQ8M58Z
	 UG7a3nxtUxPUNxN8TbkDCgA6eJb19mv9zkLUxdAt5eNlz4/L5q7eD2kWkEdYAeX3wF
	 oYKZXHtIbEusg4E+1WfNhdFkn+mWUWL1he4WpUAorxNT3RUasq433zYa9+l56eqwHQ
	 8T5KiSMf+8baKdUV4kIopYOgBPhJWld5hpuuDr7ROxp3MQt3mIQ54gVzG1rl/ZLDYm
	 L9DBgUQ+NDEjztzXDP8K0BTBC7seHkXnVsPmXxN+41c1vobLIkG9khccB9tckA7rOt
	 TvF2qoNuV8jHQ==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-716b58a4365so1201063eaf.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:07:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF+CkOx0GDEH2HwauFLN3joKQMlRX7OEI+ofu77yy13HVzxdJQybY3Zk/yst1KdSqbyBjhcEMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fTTVFa969a/JAKLUsgU/SCsKcN0/qQNcrmeqJt578WUYiiOsQ
	r8MYx7WMVJqqeKc7I/o5wGYWuMxwB3NJ27Pk+MNG+bqdRNbKxWu5m4UHXdNO2xEKpPIrzeLCL2E
	6LCKj3E1IGHXbOCZUV1gdupnhocEPzkE=
X-Received: by 2002:a05:6820:4887:b0:71a:fcbf:2470 with SMTP id
 006d021491bc7-71b18487cb0mr3689287eaf.35.1795082861721; Thu, 19 Nov 2026
 02:07:41 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119100414.13635-1-zihengw03@163.com>
In-Reply-To: <20261119100414.13635-1-zihengw03@163.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 11:07:30 +0100
X-Gmail-Original-Message-ID: <CAL4Wiirt_H2OK6pBNG4tOZdiVOQQpAJDK=Vo6vkKJsasMw4AXw@mail.gmail.com>
X-Gm-Features: AclHuK9nktjco5gsyxNqtp3kam55uGY77qmevX_EOfaPr5ulVyu6PcDAfnwyusk
Message-ID: <CAL4Wiirt_H2OK6pBNG4tOZdiVOQQpAJDK=Vo6vkKJsasMw4AXw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: do not use SOCK_INODE() in sock_init_data_uid()
To: Ziheng Wei <zihengw03@163.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 11:04, Ziheng Wei <zihengw03@163.com> a =C3=A9c=
rit :
>
> Since commit 5d6b58c932ec ("net: lockless sock_i_ino()"),
> sk_set_socket() reads i_uid and i_ino through SOCK_INODE(sock).
> sock_init_data_uid() calls sk_set_socket(), but its only direct users
> are tun and tap, which pass &tfile->socket and &q->sock. Those sockets
> are embedded in struct tun_file and struct tap_queue, not in a struct
> socket_alloc, so SOCK_INODE() points at whatever follows the socket in
> those structures and both reads return unrelated data.
>
> sk_uid is overwritten a few lines later with the uid passed in, and
> nothing reads sk_ino of a tun or tap socket today, so the result is
> not used. The reads themselves are still out of type, and with
> CONFIG_RANDSTRUCT the inode fields can land beyond the end of struct
> tap_queue.
>
> sock_init_data_uid() was added so that tun and tap would not use
> SOCK_INODE() on these sockets. Set sk_socket directly there, clear
> sk_ino, and let sock_init_data(), whose sockets always come from
> sockfs, fill in sk_ino.
>
> Found by LLM-assisted source review and confirmed by code inspection
> only; the out-of-type reads were not triggered at runtime. The fix was
> build tested only; it was not run against selftests.
>
> Fixes: 5d6b58c932ec ("net: lockless sock_i_ino()")
> Signed-off-by: Ziheng Wei <zihengw03@163.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks.
