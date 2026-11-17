Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874425;
	b=FcokKVjIHGR58MDR15O6kL7q8BpF1J0V3o/Vi9dCl0ZjPwcTKBRMiTM6PTb8UER1ZKw+
	 0l7SfmtGDTkOsQyCcaG+r7EPUL3kLdtFEM4NBztI+lxi/eFY7d0G+KekOW6Mo0r7B4RvN
	 JWNdUJzMaDSEjynQFAuBnn52fnC9zOIpE8L/6BOBYpVgngJXswgXAldKNw6VPG+cVEJRv
	 1mrHprFnmQXHkeqQUfXT0JW2rLaCCjFQL38xLPdy+NnwnGrL027Dep/OaU37qogC/jbpZ
	 F/U4zB7/PLhIoNHw8OE/BFjFBWkj9q4zSVNMs57QPUO0Pzpxy+BO8ws0BnLanEU+3mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874425;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h/gdacrfTiLelWq/exWpeXojbuqsCH08OJQEuYg8YBw=;
	b=5pzxtLoJ2t4Ub3PCmdOrYmJh1aU/SwbesxkSzCwQTXZisYAXcjqThbBkWrUXBOfMBwU5
	 E5sVwdhzzZVG+kbUxHwPKfnqylKKxPOMwHUphewO4yP6mdt//sROaMXAas1ZE23NrJFb0
	 QgjlRwsGernjNoE5hNfkCW5D7JNhaTFKRVBNx0TWhR9RBtsldDrFG3AaFd4i/CC7ZRgH/
	 WdJB1cLesMmB7e05+Lxiivb1HuytE6sgujuj9k//UGnh6HRVbTyAjbJIhMX0Em18k0Zo/
	 hYsPcatxFwF6PyKLaDCG11ZBr7bIpluL7PK8NyHjEgt+YY2Mg8yVhWDddMda3GC/Pfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEAB606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFEAB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cddee4abc57so487841a12.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874424; x=1795479224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/gdacrfTiLelWq/exWpeXojbuqsCH08OJQEuYg8YBw=;
        b=V862olwBWIwJarjoE1wZ4iAPwnnj7QolokDJDUD6utRvJtvsZRvGsL7xsnLYMdwOlV
         24MXEDtsDFCerdM7CkQc6B6VdLndG/+R1HVuO7UnLT5TcZh7cpukXfcRKhQ7lakC55Hw
         1VrhoZO0L/hRG/sxijX/ujrNkZy+9TusyfqdG2FZ0MYw6i9c2X0GD8nylZrzbOlidqRr
         LFLOB/56Rv979ke+LSx6sVCkDjpEn1e3VCP0ifUj3QCCUPAdObw4r50kTK/USTh6IAIN
         N+FI+eeDmrzJggshi8YkxgpQSIhixH2/VphhaTuwvf5z6Fk25piKS8NUR6lRDmhJk4XS
         EaPw==
X-Forwarded-Encrypted: i=1; AL+hErHsrdWW1YIxyj48Ze14ZMQe32qsosyYt7IBMFSP2iQNYgYHt3gVQyqiKrS8s24UgO74v4mWuv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ryDF6N4cFvIuD8lSDji7rWSZPw+NMqD9EG+DHSO0OFMtL0RfX
	TbFOPRin2VzDbARUCqL3M7w2bynBpT9IBvcgzK5ii7mRrAcWnyGlZVmYFq7D7clG
X-Gm-Gg: AZFdTZfYyxykgJV7CsZ6qvfAgpWGD3AZ0B/ifdOZwrDBE3NHZ40WWXCzd4MJO/FGSQz
	SstMC+fC8pJbljlLFuTeBPZKfK3yAy27/0Q468Y6ikG00xok0UEjApsb30/wEidwhQgmNSzzW2V
	bENo33vnRfgxgrEDyNRlVP0Otp1IbuhFgaK4FTILsOaupkz0sVBVo3hw29c94nASpw79YgcpFMh
	aft06dk3YTIF90zdiBjA9zXFE2K/7W4px2Dg2ZREfEosJQOaj3DsAU8GO5+L/UUMUrZCHBjMxLy
	CFbqc9DyH24mZKKFh+EivXOfUcwmt7+pWxlqczC2XEPIMrAovZxGwvQ3gRIZXvOCvMixcOhBl4F
	D1JmeiezYwpvbM2wjhLROMwj6242UnNb2ouHOe0nM7+Vx3laH1rznxIOUNh5jd5Cpz43ZyST2VC
	UZPgTdqegAeKwvKBdRKFZywBFnaSD34wbitwlqou8YMijDvnRmrAqThb/9VS0mnyqnBvJoMu/cK
	+IjvWMKKGkVCzGTjQ2I01psj0RvY+rF18NdEyqfmXS20Z4h9jz24laV/Km2bW3AVlJK8yEPGMVt
	r750wqrS2WJrN4GAgtO1M8oPD/Bjf6R39b4hql9Wz5hM/VK+KVuknOLO/17VfaYoWVQ1nvQ1s65
	65W0Cgbpds0zXj9yWK/xYQfZJeK/4zfuiX4jMry8IUKUR
X-Received: by 2002:a17:90b:4cd0:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b1b0b5f348mr9788175a91.42.1794874424056;
        Mon, 16 Nov 2026 16:13:44 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b4cca7sm7921825a91.2.2026.11.16.16.13.43
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 16:13:43 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4938723eec.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:13:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFX+GY79pG8kWwXwY7z0+M7LqLcO5PyEIKYkiigsjDG5EQZBXG/8Xckm7vBM5btw9gzWnIru5w=@vger.kernel.org
X-Received: by 2002:a05:693c:8852:b0:36a:1452:8dad with SMTP id
 5a478bee46e88-37966f32039mr11934066eec.20.1794874422435; Mon, 16 Nov 2026
 16:13:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev> <179472506475.2199510.697226978948266850@kernel.org>
In-Reply-To: <179472506475.2199510.697226978948266850@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 19:13:30 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7BJZcPdnYQu6aivUsbrofVSEbs4W5fZqV-cO9iTdQ=0Q@mail.gmail.com>
X-Gm-Features: Aa3M54ofcAZjY_xnWHNA845PgMGAu4WiQ21uf2gdh6--4iLizzUdSyAzlZq7n94
Message-ID: <CAPY4CJ7BJZcPdnYQu6aivUsbrofVSEbs4W5fZqV-cO9iTdQ=0Q@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: b53: mirror BPDUs to CPU port 5 when
 port 8 is not a CPU port
To: netdev-bot+sashiko@kernel.org
Cc: florian.fainelli@broadcom.com, jonas.gorski@gmail.com, andrew@lunn.ch, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026, netdev-bot+sashiko@kernel.org wrote:
> - [High] The new condition in b53_brcm_hdr_setup() calls
>   `!dsa_is_cpu_port(ds, B53_CPU_PORT)` (port 8) without checking that=E2=
=80=A6
> - [Low] The commit fixes a user-visible bug but has no Fixes: tag.

Both are right. v2 will check that port 8 exists before calling
dsa_is_cpu_port() on it, and will carry the Fixes: tag.

pw-bot: cr
