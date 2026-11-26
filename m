Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707991;
	b=lXoXUFjlU4H6JJBUjNCnzw/IflcKD2xXHUPXtdeyQWPJzhi4gWg7sKKZ6eDDvhZcA94d
	 zCo9ekbFezG+ot2DbRphj60p15DCC0bVhKbLLCcS9k3x9i+IBJ2hsF09lGDCeThlSuPZn
	 TFEIkjGBBQ+KJA8EhXKtwhYALccrOkUHi/RCOk+iEAuQ9EgKZrt/oDEfEf4oU/t60g1RH
	 cW10qu9d024rol0Sg74jeleewZH00bpGybBJaB35bs+lpvhTxCb7gigkLs87YodB7B6uw
	 QgGhqBhiJRV5I6E+IGkKynGO/1OAWb0VucUXcENWNsHfhzDqpM6vhKx9Qo2sKOD9G6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=ThrtHU7JIVcephohGAN24J7wKmIcAnTwKxtX+IFGbFU=;
	b=3bMt8Ndc2R/+pnsWVLoy9/EKXHGuyv5mH7QrkDb9Oa5tBuKn+pSGHESAoPckThwfb0Fw
	 XmnWeQECt5va4lOZUZ/L79ln6+UfRI7OI1Mvnn88ccu/Vk8OhNhD5/Pei06T4B0VtK7bK
	 RmiB/BNzpsesUIvTXK9YEMlhMa3D12tDIQV0l0bBznGsAtU6MJlz1Ao0ZBHenkxMhjKB4
	 asnnK45CexswnEy5+gZbleIvwKGmsPBH1E0c0frotNGf3mSxZFHK733IdCQ4M/mPYAdZR
	 sKrGIjlU/oLTm2XmUOXZXQPdDDT+xXFc4zuog5S0FHuwzCkuIz7INz+sRKyiOYEX7Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ehc10ZS7;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F42606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F42606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ehc10ZS7
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e3b22e971so3797142f8f.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795707989; x=1796312789; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThrtHU7JIVcephohGAN24J7wKmIcAnTwKxtX+IFGbFU=;
        b=ehc10ZS7ZDz1IL/IvAdVNxSDL9JWgq3HoRFvbcCMC/gcCmwuyephjvNKdKPK3hrvvE
         4RCE4OXQLuY06pczn89BcHDypfWL0AOE1JGsWFEh6Dl+co/5zsEMvHMU6KLc5sKN3aKM
         /751XgVfwE04mMpsCScIeJGees4UX79wLrNJhicwJ2KzCkxFi2cFTKo2up3iQC1FPR+R
         utNhlLF1oouWTWO7LaCNp6voDYU7a+GeL9xC8nTRMukPT/xjPdk/s4HENEG8u++504fL
         JlmtVi8dddMGRNdxnTQk/MoG6VB2bBRsRc/Ed8RF/IfK0oOJGhyk/+sX0w7Me8YkHXQ6
         jTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707989; x=1796312789;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThrtHU7JIVcephohGAN24J7wKmIcAnTwKxtX+IFGbFU=;
        b=ER3ordV5QsVvfhlA8kFZFjQsvmSLR3BWZKNLRvl7pCYfRHpBlKkIaMAUutoGCnT5Ie
         I9GDTdK8afghF/Yg3xlW9up578J2ocTfFdCLRWkc12r4KNKJniWECjeHAN+FNm+xfwc0
         QR6L1y18hjFTnLW9ZqZCRgbqo1tkwB/DGx5ml6/YasbcNSU9b2exPDhkCh9KHNN9ZzCA
         lI9li+iwAOnvEV2aXgxbRqTh9EkQtxLgHVaHwAsIv0zsh6lw2GEeXh3lqIUm6E6BjJou
         VgCh62XptBP561RiXH4Mn5oXpsUZMIh6VcttQwrcz/pX8jmPoIefurk2gqO3NGsfuulC
         cfqw==
X-Forwarded-Encrypted: i=1; AL+hErGKF/QKSPmcVyVVLUS2nEeptgmirJnt41q4gFzv0H0ixepDl3MTVeOSA2UcNWOOfP5p8z+rSvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+487E7zw+quYsTRmoqZJ/DbbsQXzSKgSsGJ1VO7U93SzzM2Ad/
	sLURKSOTUVkLW4kuYPGTQa9+vUPjWfNuJtGfNStm+ylW+RoaQrpnGFvyasG2f+fWydlNxQ==
X-Gm-Gg: AZFdTZflTEiUNnz+0qm7z20ewaOe9xpFEyWAZ79UVJ06s88jvE4rPjoDlRiTf7AmrHJ
	y+EtKjeoVrg7LMpnz1611Qq/2OVJ7JeLoOzIs6Jkp3SOJd/u8sPP5BGxgCSVMhOoo9UmEeObLSu
	QqSyT6cziaarJQgJQZ6iOTsDk28wdxkL1zKyJ7z2JIPZr3RXZbSnu1Cw4tPh8kWjLQdmkfYa4Pd
	C31A6dM0O28RaVE6AMTsISU4AGGi4o0lC9ajS16YemOolytLx/pFqvxLLJmMNQnBwWscTsvHxjA
	qCu3vxE6TZ2DNrXiQlfEdWDU0ujKFfPSlJtKJNUpNBI+lNhEs0Euqzk6EFbFy4kx4IC3Ktb1e1R
	URDej6YOmrNEeWHwdXwq0U8tFXGK6WECgg9xqan0Jf6x4G+tz4ndnkILC+/W78MyhpPcAqs5QJe
	cRruZgZt7BkV8UrHW2tDgMLwqh2VjSozOpxNrwnd/f3n45avF7UG7WXG661vvuhNfGYf/m/q/Vb
	IBXkCGxYJaUb7fYuop4GnY+U+EH2jJ09tlP/QzQBqgeFvJtfMX3bMT73MW5Fc4DuV9puJy7DR2a
	IaWiownrU5zJPFmtqxLZcDeS1adpX+ckcaoFdaLIdz8o08X4lAYQyDc=
X-Received: by 2002:a05:6000:188a:b0:4a9:4dfa:c150 with SMTP id ffacd0b85a97d-4abb2910440mr40139631f8f.33.1795707988916;
        Thu, 26 Nov 2026 07:46:28 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm40084330f8f.7.2026.11.26.07.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:46:28 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next v3 2/3] net: mdio: Add Cortina CS7542 bus controller
In-Reply-To: <97babf2e-02eb-4efb-8662-f960a36b9073@lunn.ch>
References: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
 <20261126-b4-cs7542-mdio-v3-2-35739a0f3225@gmail.com>
 <97babf2e-02eb-4efb-8662-f960a36b9073@lunn.ch>
Date: Thu, 26 Nov 2026 18:46:07 +0300
Message-ID: <179570796761.5.9467085930727317606@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Andrew,

The vendor register definitions describe automatic PHY polling: the auto
configuration register at +0x14 selects a PHY start/end index and the
register to read, and +0x18 contains poll_wait_cycles. I have exercised
only software-initiated transactions, not that automatic polling mode.

Agreed about the comment. The MDC prescaler is bits 31:16 of
PER_MDIO_CFG itself. I have changed the comment to:

        /*
         * Select software-initiated accesses instead of automatic PHY polling.
         * Read-modify-write preserves the firmware MDC prescaler in bits 31:16.
         */

The code still changes only bit 0, retaining the firmware prescaler;
this clarification does not change the divider or transaction sequence.

Thanks,
Fil

