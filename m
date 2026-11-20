Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163596;
	b=zL5r//pHywg+3m3F5wrtF8tVPJCssjAnNRnMTuu5TsRf5qmFyPAim3mfYpHtxh7vIZWv
	 20p6eRL91XFyiBF/7gPZhFXZm5R1JeehwTiRINp3bApkCFSk5yhfjUdrbmxhHEwlI08s9
	 45u90B91ocoK2Rfk0dzg01VVUMEQhYMRWSsA4mzlYsP1LZwkSMR/6jjoqgprp9IDVQl88
	 FU8u5wpxdxxpYTefQyFVxN/ibMx5UQz5WKk4cwEi1hvL+Smcmmlp7y/6UI14KZ/CIbzKb
	 WuhWPPYfoAsUiB6HTn4bmcIbi8MJ32pK2x7fugUsauA3/e5ju8IuhY6Vt1kbkh0U7zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=R/IZobLWFQkrNx+ZQixYWoLu9nQMnwZwCLvon4yTjxM=;
	b=JpAPd5nA1Wjc/OuRPF7OvdYqu+Bw9oqtSLjDpIlsXO6Q6Aw6HP5YnRPcKy08cJ0LH4OW
	 pFbi1Myruy4gmq7yfhMwqmx9YjMj1mXh+09yY/E6acOAjfM37YSwaVOz/Ov1JSFGO4i84
	 XXI+lPkyJs/hunI/CAnA+DXkYiNTCyaRzgDS+ow/f5QYPuhTlXRz7WSfvEg46kkjyGG6G
	 8QyDAMF9wLrY8LZsy5wD26Q/U8BrB0DFm/VpMy8WTq0MTGjUljsCjktfBdc6EvhOYJXcX
	 PcmKMwlF8xwSoS05C8/OHVWVo3GxeQAQSc5Xe/SbTZ/Cx4rvr+6EksJM2Y7R0sjxgGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b="MQUEzkn/";
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB769606A325;
	Fri, 20 Nov 2026 08:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB769606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=MQUEzkn/
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 09671E838D6;
	Fri, 20 Nov 2026 09:33:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795163588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/IZobLWFQkrNx+ZQixYWoLu9nQMnwZwCLvon4yTjxM=;
	b=MQUEzkn/hQKYKBTZUCflHO1rhUyVEnUaaaubD80RYosr97kWTA8/iJDF8lzKO92L5/VbvM
	b1piLGOR5ZwRgeJRUTRA0I+PtgoBw+cxFt29VIZztSkYox3ixo24S3fA6959rMawfpxroG
	3roMPVIMqptyU3p0wbI6o/tyTzxpaNKY25QcTIQs4O5A5V5TcMQVocfCgsNHZuk15cF21U
	7hRLoKtn1p0O6NBGIrPha6QuMAlv4gTW6zlz2Gl1KMmr1fvl6J7OB7LVUxw3QGqvySzwlp
	tPCuQLoaIsZpGvbk6yidFvvoPKRx/PztM2Cy2fHN6fb4/qFgOqhHqhBpD1ycYA==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id rhIuAj5TM0V7; Fri, 20 Nov 2026 09:33:07 +0100 (CET)
Received: from p14sgen5.. (86-103-67-101.ip.tng.de [86.103.67.101])
	by szelinsky.de (Postfix) with ESMTPSA;
	Fri, 20 Nov 2026 09:33:07 +0100 (CET)
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
Subject: Re: [PATCH net v5 04/14] net: pse-pd: do not keep a failed IRQ in pcdev->irq
Date: Fri, 20 Nov 2026 09:32:56 +0100
Message-ID: <20261120083256.2324378-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179515690732.3136.5656168477825917127@kernel.org>
References: <179515690732.3136.5656168477825917127@kernel.org>
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

On Fri, 20 Nov 2026 06:41:47 +0000, netdev-bot+sashiko@kernel.org wrote:
> This covers the failed request. Can pcdev->irq still go stale on a normal
> unbind?

Yes, but this problem is older than the patch. The patch only fixes
the failed request. The cover letter lists the unbind case, and I
will fix it in a follow-up.

Carlo
