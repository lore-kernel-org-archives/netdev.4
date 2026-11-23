Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466524;
	b=EXt+kfJPIo8Uz19x7Zd8LNo73V9T8mbKmIEM5vRI8gVRgJw56z/dkNiw8URx8bFzvyS8
	 5NxLTLN+Z6RWp52PcQPjagisNUVsOOMEjGctqTgq8t65nCDczhO4mepWW22kQwNRAfOKI
	 PLskEh5j3rN0sejsvoqot900D1JxEzuU2b+I3JCClosD1rdWPBMipHVzulkBXFiYOX5q3
	 Cm9NY0QFtJK6ZqeCj46B+dqhNoCka8ehnT/+mrUbGJrm2V3KgCntTwbFh3EusuO9DvoRe
	 rsA+S97H7d413ZNIYn2XY9FJx693d8cx+mX9W8homEsjteKlSE/F7f3uzJnA899NF4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=iRRa07G1xdUZQxEGMvbK1GZwIzrpVcIfzr1BuRr7tdE=;
	b=bZIObQlQvzaig7jsBaecH49KO+xMTAXCgNMSvU8OzxhPQLX7OQXZPw3MtNT4jnxr+DUP
	 CAKXft12lrPo/+1vyWWNN2aRjelVob/tE9kNzOO4spE4XoCPS6rv0UMNBuxPOly3YUdA8
	 lrIMSynZKLHNr6LkT0h5uvVHxFBxLZsu57+O5DBPjU4wqCYx/XuyNVeyo/OPOGFQrmarf
	 jAI+UCzA1LRkNTu4WGKyHRCp5ckxYfew+JgWcfyHlRI13YMWOiNGniXMZMkEPONQIhKa1
	 We4uYAJHn5/uapf0yxQ9pblKw3CpAnv5IuCbxe7aro9dJ4cfUVsljP10fvz5cyYKMsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnFeD6zQ;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECEC606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECEC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnFeD6zQ
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1753243f8f.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466523; x=1796071323; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRRa07G1xdUZQxEGMvbK1GZwIzrpVcIfzr1BuRr7tdE=;
        b=cnFeD6zQW3a3sP/sI++8Ivx5QONZ3SGCCytu8pWJ6yXswzRonX4P6Bpqmejt1rx/uQ
         QrDCR0k0lTPfCl9iUK2zDPqIFRils/CNHRhx2SE6pFXYenpcwViivl5vEwd8ENiLi+T1
         Ut04GB4kRKSPRB+sa4GmRxHG65TpA7bDZJ0S5mvwNyc/OPaa2HmFMiWhW4LS3FwUccl/
         WZGj4Ha4h4pcAUJvLPiYf5FbRFxs0A9M//Vknty0to55/G7QdwjTo973QfKrrKTzZbDG
         TFdna4iGvKllP5tL6XqfbIsqYkIW9zKEEMCRFGzEgm++4NHsDALb5q7Upb0ZkmRjK7D0
         4i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466523; x=1796071323;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRRa07G1xdUZQxEGMvbK1GZwIzrpVcIfzr1BuRr7tdE=;
        b=vksrN4YK1/hsRBgQS9VGJL5jdLREuHpJiN3lMbM+Q/BvHvLy3Qm1pHitUpS1zyk499
         ipslR34+tSTG+FXswPtR49EQsAOqrIGqse0mApC6HawGvVQotc3ysdEqt73pwrk53mRK
         zi6U3yyJasrniNyCsTRRr+W3pKAFRhr/8tKXf5t/J1xQY9/P9VMnrBQkrgll+F+33/wV
         ohjaPgmH7gRIGfvPL8SdbmqvxWgm0qnU8Rw7D7LezueNCuuNgqGAOZpHl8+O9v2Bu3ie
         65rqLiUi6PekxcW39epJQFB8C+VjMx4Nbtu0JSLE8KMgzLVJoJm4usZfVGzHPB1FiiQR
         7JjQ==
X-Forwarded-Encrypted: i=1; AL+hErGgyWSDOxk0NpRcd0i34iH/+te5PEK2uFZ7ynItUQNPyIXlzLr8zeU4WbvdJoP87W+/n9Jd8W0=@vger.kernel.org
X-Gm-Message-State: APuU4Z819pVdAWeY5qdb4zB334FIy/0gBVtudDy8e5o7vvSrHOQ4mFhg
	pYsgF92C6Ynpo88xr9ZzJ+pgZBINIsuUGcqjIpC8k78Nl06wJNXgx55r
X-Gm-Gg: AZFdTZdgUcPd0VjCfVsXCZTC8JUK683kQ3evZzzymE9eMPnqlTNlEZFrUK5FPDwZ936
	Df+EvOtqAXK1ROk2yWcyG1a7kL2Wx84jhoVOmwkCihLzfusK6Utjj5IO92hZ+xjGQAVkzjakWH/
	h0M+Yy0pijnSXL2OX+r2RT9T+KNCR1yR74aY8ZervY2/9cwH164Wit5Tv4IuywQjcQ9VfzQ50ty
	feRsgDtUMApOn3WX+XuLPxH77FVMFjCuoTBqZx7XMC37Gjj9ddAN7FQsDlQf/Pt1M0XDAnWSlBG
	KXEYJqVpJpJTbJL93GOHSwGTdBXxEB5ulbnfvD7ey4rK1CtgswDvvNzXCCqYV+2vLEBqnt85E9w
	nxn47wJloISLzDI+FtTJnMTTj8DmssP/z7fK/DQwQp4s1NaqF5vo6QY39mF4Z9Ayg9S8QGU7kLh
	iuFcAa9cC9rXC4rGi3QNCIjt1WmZTSlWxSYEFWtAeDnQX7+KB8MuIrlswcUllnJ82xxjhKYL0gu
	Q0pgJVTY8wRAcZ7TGWMFc74MliLGJUc6jJ+498CqqwLiEhb+4ZcKdy9dlb5A2u07LgCdLn2qw5o
	3MFHqpz0OtcrlR80evam+f/eYquGb2pEv/wzVXHIbqfBB33KJCfKv7s=
X-Received: by 2002:a05:6000:470c:b0:4a6:ad0e:6cd4 with SMTP id ffacd0b85a97d-4abb759dd4dmr23243874f8f.48.1795466522717;
        Mon, 23 Nov 2026 12:42:02 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm28134803f8f.21.2026.11.23.12.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:42:02 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: mdio: Add Cortina CS7542 bus controller
Date: Mon, 23 Nov 2026 23:41:59 +0300
Message-ID: <179546651961.3814407.1392448728993928813@gmail.com>
In-Reply-To: <e55e5103-db9c-43ed-8bcb-406909fe8f5f@lunn.ch>
References: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
 <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>
 <e55e5103-db9c-43ed-8bcb-406909fe8f5f@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Andrew,

I have only seen the timeout in a deliberate RAM fault-injection test:
I temporarily slowed MDC with the prescaler. I have not observed it at
the normal firmware-selected rate. The pending state was intended to
handle that injected late completion.

I removed that state, kept one bounded transaction/poll per operation,
and sorted the Kconfig and Makefile entries as you suggested. Full
independent ARM builds with the driver=3Dy and=3Dm and COMPILE_TEST=3Dn pass.
The revised driver also passed the Almond+ RAM test: PHY IDs, same-value
advertisement write/readback and the controlled MDC timeout/restore.

Your Reviewed-by is applied to the MAINTAINERS patch only. I sent v2:
https://lore.kernel.org/all/20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.c=
om/

Thanks,
Fil
