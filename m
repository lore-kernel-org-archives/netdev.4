Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184778;
	b=jXbuhi2jDgFlG4BJ7iutkpnbU0uHEzS1AM7aWZEu8UGYegY75yXftoxO1IzD8eG+6jO6
	 j+zbwY82lHm8esJ/oVdHfzSeMWmcKEyLuIDS+m5Xsu/3Z5EFAAXhqLNwkGPRZ0/fcbhtY
	 EIhCUEdec4F4IXTnI6IYdo1Xy+qeWsKotWYYgC2D7PIJfm77e83DHArVnD94VMudZvuDf
	 G4Vy1v/KOcIO8yAF+Hq0zwHqZIXEUVw7Bb4GTBsURyGCAs0aSmA3ZZdVoIxY+ATbI3QIp
	 XeoTDb+MBRjzc1CsgCNMFfpCxV04rA3H0N9dV4WV8yXfy6rWweCMYMUkJaKkBXiJh0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xcn2AQuf2ta2YXdrV1a8uRQUDEFs6AHRKa6oE6FM3L8=;
	b=4ciz0nl4F0qUWJ93tuW5dmgxZzLRTpsUpBGMVgxs+mpTmSOVwdRsW+oeBvkBg/869ra/
	 EB6jc6yUrz/aNzVNvImC0ZYm5086K7y8GDKgrRNP14QAS3c6UcRZtvgGG+Hxdk6qgRj8d
	 1mzl9r0mQXSJnNVIxc51B0FovAYBQjzuRRcO+XJIJBfbw0YmZN296eqLH6bFTn6zwO5Px
	 P0HyhHe10ecor55ooJ8HfmC5gLcpJ1a50tttJGNu2t6MK4ePyRY9NQd6p2RrFh6WGahl2
	 VqS6the0cpaB83QZso3Wm9QYi2NcTExzSZHJg3JHKYCR8d72eozckPVvB9GrwUzec0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1f1RhkT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0F606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E0F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1f1RhkT
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6767d92cde6so1192031d50.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184777; cv=none;
        d=google.com; s=arc-20260327;
        b=UpREl/bNAlqwt/cQ3hff04ZjxhwpH4KDXPEWaQFiZ0n8ohADxrTjfZAijHgKCn5Gej
         q0CfPcGeQko7Ua6fAgbw1rjwkgMU/9tRyOjyP0RuBZo308QqACe5N0dnxTx8YCZmATXQ
         zCxAmfWq4UbHFmkyz4nGFXoFYEb8cII5nMirRAlio3jr0yYgeYXLXHMypRrNZS2BdJ8r
         m4YicNtjvarYa46cqv83ySzL0vn4E7H/ZJZqS6TYfE7gHR6xfGcMnWwZpt8KJaVdRsaQ
         MXoDMp1Q61Z3dbpz7rzfGyk0ABle4XAPyYnKLkIhx0pGiBtSrTN5DlXYS1pwDD5VayJ4
         h6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xcn2AQuf2ta2YXdrV1a8uRQUDEFs6AHRKa6oE6FM3L8=;
        fh=+Hbfb50f1RzyPHwY99ZE+K/A1HL1hLKiq0XD61z1q0E=;
        b=d43rrMGkAnm2QOD/vW0t6aJKr5nN1JHsiDMtyE6jVQkPGxiVVWN2eKMjgNRNp/4NW6
         cwRD+GgD+4g0DF46QevLwks56tpOBYtMys7bhVohljD44/XPuvuF+Xz+K0++j/HHJ7Al
         Z6e0ruKnPoLgwyg+yc/IBQ8gw/Iuz0SPwWOu2E9kzx9QoCJep9RDeEqB6k2dXxmIJSNk
         C95K32r/nh8iGVvB8c0Es0PDgjR9bhH3MBqaICTFe85/mv+c6vyPmoZ6eZA+Zmxo2Dsm
         oEMh5hkZve/Z6IIbfBCSNyPXb9q5Ww3J/wprR4FOpQnYw1fZQ06wJzac6l87Y4v3iv9B
         2D5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184777; x=1795789577; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcn2AQuf2ta2YXdrV1a8uRQUDEFs6AHRKa6oE6FM3L8=;
        b=N1f1RhkTN6QXGTBex5swCSX7bKt6VzVd5jQLXgm+4lbZ/Ezd1NPPUe7VZFqNjQUQfn
         kxEeBQ10Ag7+5jNe7ASubr2TDx5e0hwx8detiWZiQKMDLMyLgOMpBbgaJObe0YBaUZ0P
         PO7gon9M9PGyKOAcknjJj+JBPcLQObeC8jeI2Eye9dp5I2P5c7NBDqh88Vrso9YvphkJ
         7FAmXnIOGXyfgGkBkrEOvbB7/IM5w5qL4EE+3ffg49cGxPFg+/Q1vcgQMCeQKuoTbwY4
         PUW2bAUNFYweBbdojGvCsXQSAhoThyF5l9bUc7vG5/7ZMu3PmML53Z1XaCVJUW3+Q9DM
         sEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184777; x=1795789577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xcn2AQuf2ta2YXdrV1a8uRQUDEFs6AHRKa6oE6FM3L8=;
        b=B1+MnZ5rQIXPral9N3mZlF8a54urLAwJWlB/NYEVEWK5z42ampIio9x6BY8TKtiPF1
         mthdXgNhLuoOO98Gxw3+6ZWcybeaMgqyOY6ygEDVin4LV8aR0nOj1KKu7xYYH5Dke6C4
         /nWhsN7i9ZFD0h2FfalVdbx5FzMrUz67Fn08sQaJKgFaVtoL4HYGi7aOh1eAIYWSNf8/
         fPt3bd7d2WchRqIT80rCJ6y6JGz3X272chGFwGHJcMLM4nU7eF045z1xLU25iiHiyJ/S
         aV1J/x+oaupQIv9/k1ljcEeESC5WEZu7/d3oWjrrFdoJkgt0rO+Q99oCeQsc4yBibHYh
         cKGw==
X-Forwarded-Encrypted: i=1; AL+hErFrfHfMy6UHIpz4WTYHYtJD2K7AjRikbyVLKQkotOi7RqSTdmsvnjWdARglzFHH7kvrnmZ3TDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y8i+Opfi3nvbslRDJox2S9Gasj8pO7iCQFkXZhir9ZiqVWPlm
	jXuKujlInyczRNmnNagPx/VftMeJ6i/BYCsNFPuvFJVhCNAvA91iqka3MC855ifkTQrKH/4Z2ag
	MZyybixr+W7Rtr6PVL/8buPEMKCrdSr0=
X-Gm-Gg: AZFdTZey3zowoxHPB6h2u89pbF+G54M4uC2TbMGki4g6bS3Dyzzmyy8lvHKo7sm32X0
	u9jfoycyNFHUUws1RvK9P4Dqu3iISE5iPihNY5ZeY9PHpYuW0+GMl901GAA24/bRRoIC73acjiC
	L6o/n8Ol/tGN22Dl0V5zaxP1VuDQRm5vbSE45+q6cbSq2NOLBLAvEAHVSHGYIOwlh9S4Fi5g2tN
	wduEG6BP51q6cEK1+SpLjU9cYHx0ZS3NdfPcrTwMAHKtzrBSCxS8bORyttEg24dKKfuwfZeML5O
	w2Cujjg7Yi3nB1f4J7oBXsqCaruSK0SnBjQ0Q1SyxTIrU8xkjJ+iru9nhRAxJMAZQHhcU17I5Sg
	lEHdET40XDTjNK3omSVu5UyGKrqy9mBXFOdyrXrbhimhZ2qyOdr23ZzK6rIOSNXlC9lndxTKL
X-Received: by 2002:a05:690e:4513:20b0:677:cb45:a479 with SMTP id
 956f58d0204a3-67df4430e87mr1069873d50.68.1795184777535; Fri, 20 Nov 2026
 06:26:17 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com> <d966bcfd-1718-43b5-a2cb-ee5932bb361e@yahoo.com>
In-Reply-To: <d966bcfd-1718-43b5-a2cb-ee5932bb361e@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Fri, 20 Nov 2026 11:26:06 -0300
X-Gm-Features: AclHuK8IjZ56gnZT6oyb7irgAwS55Z1W7BkwG7Vqas5F9wBeh5-GbC7FzdoY3iU
Message-ID: <CAK+kzgxDs7KW_fZo82zSvxpniVrzNRwnGRj0k2spU938-hWoFw@mail.gmail.com>
Subject: Re: [PATCH net-next v12 09/13] net: dsa: realtek: rtl8365mb: use raw
 VID for PVID on family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Tested on a TP-Link EX511 v2 (RTL8367S-VB), v12 as is: PVID registers at
setup, PVID set and clear on access ports, untagged frames dropped without
a PVID and taken in with one, priority-tagged frames taken into the PVID,
and a PVID change in a VLAN-unaware bridge with no effect on traffic.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
