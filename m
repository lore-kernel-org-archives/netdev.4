Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902915;
	b=EImJ3gm/t75VeBdE/HJk7D1LVFtQ7tR20wDbiwXl8uMT5GK85DiNw1tA30y/XqkKsKJl
	 OUXQFHfpCDv8BaRYscj4Gczx+azWlpzavX585CdXhPgUdMPUwN4Cadsc2B2xuVK0ITRmZ
	 s1k+4kvoZQpVOeTlNeuUxsJz+aSN5VZvqgenH8UBGLMVnJXNwtHtpBV8bS4SJCX7TP4LJ
	 EDOy+tpfoLE0PkP9ezHJmWTDmYVwT92z373K2f6fyjR6gcEr9og9jnLSfqXK83qLX1Hzo
	 bU51gb/wq+v7c9lmR4htL2lspnnUXCg9FA55FiCbLG9506nDm7fGeDS4YEhx7h+e+Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902915;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S9j2DxRMvuPIq7YPf+nCx2BBPuZsSR31Foupp6gHMVs=;
	b=FxXZa3dqMJu+yzP2opytYN/vu9t4iLXPmTiUm2DpUOqnPtL94T6OdIJSExwx+Cr+zkyp
	 s+xAoMN8A2IjEE0HqWt4e4aYXfi3uCS8Viush1Xlpxik2TRO40Dwx6U0kHmi3Wi+xmZZy
	 gkClJgcBpthDYf8nwwyPYg9R1fUH8DYYKdBWwzm30LyVWUn9HYndN3IUUebGcYm91StE4
	 F4JjAF1ARBzV1tUHbyLxsN/6XN4DIMVFTetsKjEqjKxJ7QYJJCspRpc/J5yFZHYmwg0lP
	 GCFUmroOtLYymCbegAYobZb2fueKVs7QmVyvK26oKJ81C0uDqdxFq0UQSE2fbMIplBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rc1GkNsW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F53606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rc1GkNsW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E82E1F000C7
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794902915;
	bh=S9j2DxRMvuPIq7YPf+nCx2BBPuZsSR31Foupp6gHMVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Rc1GkNsWDL7oFUa+sqJsOYjcAefrOPYMWMVy6n1IN2s7TAHjgyd9ILxB7SfBgW6vq
	 y7YXzxYkIgM2VvuSUkiyBtBrTMsIN2gj+M9o9SOdn8yYuZe3YQVC4NFaGY65Mv6uuU
	 72/J308Fdno3hbbdWDp/muPI+vXxvN4F1x9mVsN8U7WPmRZxAP31AQDu5i2uuNZz3A
	 T8D0v/sz3JQkOun8lXVuUjEs8mE+s1dz+LImFMIhIODrdDoWq+F+UKkHLg3PqXMHwm
	 uS/BMVd/E3AUhYe4BMdXZ3gHWQ74QYl8UOjBwKNjAGULr+xzVdiwaS1mvdr1ekBPcQ
	 K7MKJsH5Qgk6g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so3789741e87.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:08:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGjZBqUIT2XESYEgiXoXZjxC0PKC1NWH7cE6c+NLEaP8ZdaLjpwmsd0kSM8vmTBDcwlgE3yNNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xHYRvy4psBeNwiVK3MBJycZn2iWOjdc9tTFnt+aLIdMdm2eXy
	9WIUflT7ofNhtAn4S5ChF62z/QcDXJR1sZh2R2ZgK9oPMvP3hbvkhICsiycAySHbNXP8I9+FpUm
	ieFK4dmbcrIs7fE0kZjC2E7EVm39RygQ=
X-Received: by 2002:ac2:4bd6:0:b0:5c1:4bd4:9913 with SMTP id
 2adb3069b0e04-5c1705d7ffemr6389023e87.5.1794902913840; Tue, 17 Nov 2026
 00:08:33 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-gemini-ethernet-fixes-3-v8-15-f55bd43e02d3@kernel.org> <179484035038.3136.14929259935888158241@kernel.org>
In-Reply-To: <179484035038.3136.14929259935888158241@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 09:08:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Lq5rwgjntmTAGeph11BLg+jM0OWVmz=399r2Hg68z8Q@mail.gmail.com>
X-Gm-Features: Aa3M54q8-jQOtrpLYMWzsJXWgY799C5Whox6TuKceRZ17Qg2qLoYkFDMqF0RYdU
Message-ID: <CAD++jL=Lq5rwgjntmTAGeph11BLg+jM0OWVmz=399r2Hg68z8Q@mail.gmail.com>
Subject: Re: [PATCH net-next v8 15/19] net: ethernet: cortina: Serialize TX
 completion statistics
To: netdev-bot+sashiko@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl, 
	mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:45=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> [Severity: Low]
> This isn't a bug, but should the comment on irq_lock in struct
> gemini_ethernet be updated as well? It still says:
>
>     spinlock_t  irq_lock; /* Locks IRQ-related registers */
>
> This new critical section in gmac_clean_txq() does not touch any register=
s.

No big deal, that is the main purpose.

Yours,
Linus Walleij
