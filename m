Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503636;
	b=Drr26+rTtqyMe8+TTIHETKo8tSAV8bn7RvNZ67x3c5D2GPn2r855Ip76wfz3XlVmNqSg
	 nTkrKg8XcLZ8CpgDAkYbppNuvjY84EBQuNYygkvZZWQ+8YmlQRqcrGAc/NH3seWyw/N3f
	 hWtnugQEbSn0/Nz9Tpr5QG3RhEOX4L1KBFlCfaji0lrwaAFUYtnpzwr197hb3lZtQpNIo
	 8GrWCpmYz1wJ2JEY2vIwwzOVwY16N+PWE/Mp9cerZkJO36/qGagEdAtooLW6bBN3Pi6nW
	 n+EhXKor0WRHWGMWSFTVa3Ixx2y76SUsUyUHPDsDd1umVnXYoazw+3cToLaajnEDeZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
	b=KHJu6ROnNKJXd8UtTZmpru7okaOOEGJEYcNXrUzPobuj5eahnn+NTjnQp+zPOk2XS/p8
	 zK9naN5zpZcaT9es8k7hp9q30LkiVy7sbi/uEAQ1kMBfvSetKs/tJ5jSchnPqVyfEzQbH
	 5JS26/w35jrOg3oejFpCTfQLOM0f5mkvlmzgcnnBj1TsPMrAJgcjDWg6Ed/8sZidbsE49
	 y2jH1E0qyBIxMpwYiBykkoFRLNXluR+SjLd28nyMVAy1UfRNUMt+2Gdh+B1WLOo9e9tDk
	 vhaewQk+8uYfKFVbMnb/mG+YjiZkUzVTd2c/Z1rVzKWT3R+U19YNJRC6ZmtieRLxIuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gfm54EBI;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2736606A334
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2736606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gfm54EBI
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c126f80426so4163852e87.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503634; x=1796108434; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
        b=Gfm54EBI4fcos0re543fI6RXcyiEUs0tY0dioSTbUsOMcKVbUYEtG4QhLs+356Uxi6
         NkVnrcCacS05rQX8R4bUQsfFTT6qy9Wumse2s7VYU+Fklz+tkWEtkwaMpcQTxmDqiIDJ
         kE9ZfdQdk4uAZmXmoAdo5cQdVjLiS67+YAk6DHmlPWUX0gZQXukXZxaXjX8IAXsnxcOT
         5jN48kFWwlHfHgrZa8x1VAQijfaOr2QCCwQKjTZoaZQc+7HzZeQ41HyBDUOu8dNQ8Ab5
         ukIm+YvvYwhZ+rhX2Wrm3syfa2ziiudUb0Itt2kGbNyHwXBPx8kBF/6e30owK2ok02kY
         7QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503634; x=1796108434;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
        b=BBtcN11ei+xt3wSXnLU9S2ZrGXi8GLeSofqjjO+ITNoA38H2dKIg1xHXd8nE+8KFDb
         4syBLTM9nsdercA/kkGDA//HAnAmy6Iwxc82Y9Wz4OFsgkAEEOhNQDT1G9n+vs0Zoopw
         yt81TXA2dgZUoPUfrKrwQ+/P77rP02CGxR5u+oItM3xXsGz5lbkNfkNYqWPHFOJaTYuq
         XD38oZ4IC6pvlcQy0fYBFC0+8vtnPw3SXbIpsgQ6/Mt27rxsVoytzNsWd5M0/xXEtLN8
         ZrnUFp+DFE3oknpbQdE8YihEE5yvw/qDT1Yjecz90md4++BLqQlQB/dvC9KTpbOhmAeD
         C4MA==
X-Forwarded-Encrypted: i=1; AL+hErGgUbaxw9S46jJX6BMOO+QxtHPe3mj/3dn9qlWghtjujvDWyYKCM/wUdYedLdObYKGRdgO+qdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XAp+wIP7I4EJZMW/YcLGQhHjDhn1KSljzu0WIXSCPGXYv44Fu
	HWpjWCunFC7i6TXvsnXDPY4nE1eN56x1Tmu7854A3upGuHwJ8klizx2O
X-Gm-Gg: AZFdTZcaIChTAs3+Zjoil3DMl3CYEb4VuL7L+iosZ2zqXz/j+sjCvGZKels6zMz9gxh
	GcxBMpZP7eTPL+Vewqs3F1b5kd0QonzlOXuVdHW3e2BJHVzo8yFF5QBn1iD/te/Me6kQCUzkYRF
	+i1JBKv+5xMUt6+rdYQvWMzdFqWRBUtUDwH+1UG8d0nzqvOeYPMN+nky55FcwTAuKihSO3OEqu/
	E8ZWMNJs6MoSvq60Da9jiHBizrIWiTyb9lLc/qGAfkty49S6EVPA2UKACNXtRgJjbl6H46Rf1L0
	IybyjhcU9Th5SQnlFo0mxXUZMgwCvCxXt9v8O1TtW5h4TNsHIKi4bRoXt9M9prv0BCr0c+YPvkV
	vkOs3VvADaoojGF9bzJkTSp1m0M7kxf4/GgnednZWT1uu1kGpqDS83lG5z4DQINcgj2K34Xylrh
	baxJBKpeKlsHb83cOSSd1X7mklj8oew2inyW0OtsY9EyESg9OVy3km0niPLooQzXhDB1aPo8Qw/
	4m+w92Kbg86LTILUEHnRlK+FK5Ac3WvI0SDYsI5/+Tmskr7z78m5yOxzejyDblt53vc5pdHFbNq
	f3o0I0aPtwhchOi++XFH+xVN/7WrBUPLk5bgyHxkbrRe8mQDsvxwteAiELfYO8lmajHvBapzXbS
	j
X-Received: by 2002:a05:6512:1394:b0:5bf:d004:a84d with SMTP id 2adb3069b0e04-5c1bc6d11ebmr3582097e87.5.1795503633589;
        Mon, 23 Nov 2026 23:00:33 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33312sm3554315e87.4.2026.11.23.23.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:32 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] dt-bindings: reset: Add Cortina CS7542
 network engine reset domain
In-Reply-To: <eacbc1ca-d12f-45f7-804e-2c7454d97eaa@kernel.org>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-1-fdb5e8c2d508@gmail.com>
 <eacbc1ca-d12f-45f7-804e-2c7454d97eaa@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352891.6.12053051010700273859@gmail.com>
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

Hi Krzysztof,

Agreed. The shared-global follow-up moves this reset into the parent
syscon provider, together with the PCIe gates and resets:

https://lore.kernel.org/all/20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com/

The prepared Ethernet revision removes the resource-less NE reset child
binding/provider; the network engine requests its combined reset domain
from the parent. I will collect the remaining review before sending that
consumer revision.

Thanks,
Fil

