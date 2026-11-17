Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933711;
	b=yRKNN6QtpNihNMIiTIvbcAfh1AFejVXeBHhCq3MdWz67j5EvOUJQWCT7lcvCvyYLhLGq
	 yfDrpSwraN9mOz7qKJIaAvRrBw8cmTdNSe8UK2duQPe/u12T2psN0ToZpwliuhJLLfjFC
	 vERSBTQtGRUIehiC4y8sHD2jvk3ESSZX7Kif9xqLLCBfaZ3X6PnZae+ELkrcvh7wuy9V1
	 x1mkCmTLXqGIVuTSJqllFsi/vBhUBiep/EpKJ2ZLbMCswC5jxvr++avBFoDgcVXCIZLnp
	 cP/CIB1qva+7jYylURTToxPKdq94m+0Zbe/Gp7lk6jQdpZvQTIuaKkq43AfBa/X/KsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
	b=vYMYbGDuyjQ3NEJ49+Vr9P+rHBIUPn0hDK5fiYCeoPSD1h9odrfRexy5F09njpVY4jHA
	 zE7cqqfE5Y7Xu0kozUi2Xm9PpMd66dVjwav8iVYsWKTbNMxTEW+uoTsJPEbN8g2K7ynMa
	 ln7GK8/I4HOzXYrL+56wOTcZO6EU4MlIc6xUbqjSxLSK/4YNUl6NWITAZixfJu/hM1Nci
	 +FsXoxD/M3eBIqoT2rUSde4ncKFQfGggowvByw6cLO7F6djeJ7LIdPFf+hHBHIy39f5T5
	 bsPGN/3i3LXychO8vng+S11GvTTzImrMdnnlEXOpg91G0d9GSSXesk18/0eOsgV2stw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLuUHnZp;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5B4606A331
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5B4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLuUHnZp
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49d64a88222so744690f8f.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933710; x=1795538510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
        b=hLuUHnZppPhy/Th6btQWxH3Y1idAk2DUmxE3csbcvOL4WPJtEDyOtKiMqDPCv4zs7z
         H1YGm6j32rohyNx59bNyLs2gexyMGcUwn/D5gDnBwTUxKDaus9E2ic2phRPpNXPHWL3v
         UTAM4IcMyI56YDOeTulD4LVRL7DGEUsD3GbLEAuaLaSxMwIGSB+vC0lkZJuyqOzpokuV
         a6cahj9NsKekQbKC71QDL1FREYe6stFQREX0J9VICqTgbLT6Ra2+xXzLxaVGvmwechD5
         u7ve/hUHQ+yGQdtUtR4gLk99ZFyaPEGln7Z5I+RSkWi0iXOlipngsrRFy9gFhfiI/bRL
         pPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933710; x=1795538510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
        b=nZlbNI4adJCa2cjsYXzbEV/TVR2k40Zu7RqY04zm5hfmNhXzYlYLsGKerolJkdtGvK
         ZBK+LoPTdBiEsDl/ph3oTXZmKiHQQSsyGu33opPn1Bml1xwYUc1uuHippNuAwfJlM1rf
         GhT1d0zvZl8YxoP+vFkrEvI8dOgJp87jsuAR6sM+zhBKZOFmelyxUtzoGqeZNn1Bj9gA
         mKdKZfzCODhfuqdg77RSEtht2SeUc5wW+Je2PHvS3Xxrn3v8iz1yJ0bmdRDQhtk47E1E
         0kCk1ISUFKoEImCTpJl3PVJj39eaKwptIAeuZDP6RlBWKKWE7OjSkrVPb74JIGZB1Qj+
         nC0A==
X-Forwarded-Encrypted: i=1; AL+hErG5Alrb8xYJfHq9xHfSFOympKLdw6Rpyr6w88I/T7S6/PSl5whAXHve+Zpio9eDd++A7EOY/Cs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oTKZ1AsyxE08rapgNkWh5zCm+MDpUYwWX5fgSZqz6Al1tWbRe
	nxs653wyPmoXr4PDqOkUey1uuKf1FU+kqDB2vKlFDDrwOL7TGdtKW/W0
X-Gm-Gg: AYBFou3KUeusZT2rnDi2SWF3W6Go7txZiPYHOnrY6N0Y6yOgNXs/OL2OjBkznLbINnv
	cJZosOlbI+bR4NzaxVs3ZRSVYT9pShOOtPa5uV/1km3metlbM04yT4oaGez9SmNDSRYaM32SVUE
	9/oA4YqCnbwCLKo+QniK3YgkFewdPxMXniJZ7x5Rv63ynePmKxaD6LTfilYM61pzb0Cmo40kK5l
	pTnoatk+euyL2rVqcVttKIreqruZf9WGcRn7uiNhx/gowuy0sCYrBQ5w3HVqPGQ+LpBSLz6qBCV
	MHcEuoYHnGOtw+Qy/0U1rX5+Uyuc/ieNacl15d8n4I7nKqcLzh32Muf2IsPLaZty9XYv08rnT3b
	sfa0YSMH8rPRtwCc+5w80d+Q43iB8CDzQW3+zoRrxAT3MsN5JlugYmrZdhaGMvggJjWftMhUwie
	DAwhHkAGaXukOxnvQ3RsyZ9oFn0kGLIk6ApXHJJJVbmBGadRpGsNaRT0RA74boN2oAfnTKiTbIt
	jYQARpohEuya1Kry9L5OeffvBbJfn1NAwJeGcOy93zvKgJ7dkExNDBUHbwOtG/6EP2f9HkvClNX
	+pjcsNE20hjd0eS37qaTmfEN4z5NMNR8k3kN9+pWo1qQIes1M6KkQwEGI9RgGH6/Mvkq9R2ZrK+
	B3dwF966F+bqcEO1AHes68nEjA1K7Dg+0WlM1NNWbv+WjgLRMv5ZXoz8=
X-Received: by 2002:a05:600c:4584:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb7837a4b9mr69213875e9.7.1794933709681;
        Tue, 17 Nov 2026 08:41:49 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:48 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] an8855: add MFD driver
Date: Tue, 17 Nov 2026 17:41:27 +0100
Message-ID: <20261117164132.47167-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This micro series is the AN8855 MFD driver that can go
parallel to the DSA driver.

Changes v3:
- Rebase on top of linux-next
- Reintroduce switch part
- Add already reviwed switch and phy part
- Use fwnode API
- Use __free for mdio_np
- Use capital letter for node
- Reorder header list
- Use ret directly instead of ret < 0 ...
- Use macro for u32 shift
- Use full 100 column char
- Use unique ddata instead of nested one

Changes v2:
- Rebase on top of linux-next
- Drop switch part from DT patch

Christian Marangi (4):
  dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
  dt-bindings: net: Document support for AN8855 Switch Internal PHY
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  mfd: an8855: Add support for Airoha AN8855 Switch

 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++
 .../bindings/net/airoha,an8855-phy.yaml       |  83 +++
 .../net/dsa/airoha,an8855-switch.yaml         |  86 +++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/airoha-an8855.c                   | 568 ++++++++++++++++++
 6 files changed, 928 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c

-- 
2.55.0

