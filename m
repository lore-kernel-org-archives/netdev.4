Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163600;
	b=4ekJjAEhBxarw2bgAadgoyVX8voc/2x71s48afXuqWP86oSo3k8e+Thg69E4jWc4nSdK
	 8Ifjd+amPePwhL0vDuzT3m49xidsZAunHXQZceXrcu5hdP8lvscR4qKH2hCroDQo73nYX
	 iIkhCLj9/PVM05FPU8kICbICM0+mwKZWLMt+pCQo7KF1klOEGK14c35/Vm2VqPWsw7nb2
	 UsBtnAOFFbICVMHc/XHedesTpE5gePImFTndzUDBuJgHUl/LzYbIlpowLMqFIjY79RAUp
	 TbOAwHyDyh6dWb9HTkWg0I691/2PfLcH+MwVYSDq5THVFoB9rEDxpd7Y2kxXrm7GYaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=SFy38Ff+fwopy+XTQXnFEvx5fWF+AgpWGQVRDcX7MMY=;
	b=USfz/k2prQlp7Gwk8lsX8sayt1TDPHtRIDyTSvkfrT94nAv4Ovij38u/zI5TwlhAiTCR
	 yhXYgRwXg99R+sXIdTf6jptym63RvrBsOTBiuJDc64Fu3ve94HXpPX1o9HF6Vyt7tHNfm
	 QpvICTEvdJhxTc1wVGW5QqwaIVhGappH3ZAdjCqvmPwAh5nBjBTKOo4cms3Tk5GSo5iR/
	 iU/opk++ejSkwPqKSOly+QOoJW4pFFEP7YuVGgCxDaeswegCciwNVpSSfh5U+qyXQHjSV
	 aaeziNiRPdX9mUPCPW/sz/68tc5YaglgiKt9UIKxthRgku3zBG73C984di59n2104Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=OwdBDEOt;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E2606A33D;
	Fri, 20 Nov 2026 08:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E22E2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=OwdBDEOt
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 74B48E838E4;
	Fri, 20 Nov 2026 09:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795163598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SFy38Ff+fwopy+XTQXnFEvx5fWF+AgpWGQVRDcX7MMY=;
	b=OwdBDEOtzHhtFdO1nxnXdpVCuc0Uazna935DXLfK4i6F4Angi4sxBVjOR+YJp3ayASDRko
	sS3i01u4iXjJhyee8mdtvDps8hmJwlPzXlBRTFiGq5ch6zy28FukHqyySqs//4s5RgEnMB
	YiYwRSKrQLoVqGbQVq1/CMPoYfvnq8P9RT9mPPG3STxwXnxexjqUBEerHHtZmKaqOrXIWj
	90iUUVqDUkcXHoSDBQTLO4e0uVZUve00lEgtw9KWolxkeXybifX4TWDW0tsgCKH4a68fai
	pZx2vqaMwBzBLKJJseWSs6FNUsvBw4GIvCC1m3VvM2nxqCzGqivX0rdRfKLmjQ==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id c_rhmSYciU5L; Fri, 20 Nov 2026 09:33:18 +0100 (CET)
Received: from p14sgen5.. (86-103-67-101.ip.tng.de [86.103.67.101])
	by szelinsky.de (Postfix) with ESMTPSA;
	Fri, 20 Nov 2026 09:33:17 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: netdev-bot+sashiko@kernel.org
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Kyle Swenson <kyle.swenson@est.tech>,
	Ross Cawston <ross@r-sc.ca>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 08/14] net: pse-pd: stop async event sources before freeing PI data in unregister
Date: Fri, 20 Nov 2026 09:33:16 +0100
Message-ID: <20261120083316.2324608-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179515691327.3136.4761180533573430766@kernel.org>
References: <179515691327.3136.4761180533573430766@kernel.org>
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

On Fri, 20 Nov 2026 06:41:53 +0000, netdev-bot+sashiko@kernel.org wrote:
> Could the flag be cleared in pse_controller_register()? Or could the
> kernel-doc say that the core expects a zeroed pcdev for each
> registration?

All in-tree drivers get a new, zeroed pcdev for each bind, and other
fields are not reset either. So I leave it as it is.

The other two points are fixed later in this series.

Carlo
