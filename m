Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.71.1.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827802;
	b=l0Je2qP6QeefL6DEqK/Gik5GaVFDu6Bbwhiy/nm9MEm6kw2P01ukogyetKIlzz0Vhu7X
	 xJyp4UUhKAdYVi0AtuHGyxN9WFLkW3bdnbGzocXdo6EGBSQGnYUgqiNTLFGsZG2JAmHNe
	 LkoSucFWkonxcw39lwRVuwIo8q2PxK3FQPE/klDL3o+/jKPwxvvQeW+Z7Gf0C1EUJh8AE
	 Snw/6Vt54qpUPjS8QcLLwaWohqB/xRD8BIQGxHvJhUBv6DbtCTFqgb+DziigF5b7wS5qK
	 ZFhXPWSb1WbyePKJVTtj9KZx7QS8m/NY1OtUoOhkR8OUgFbM+dOJdhhVPOoeMye6BNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827802;
	h=DMARC-Filter:Received:X-Barracuda-Envelope-From:
	 X-Barracuda-Effective-Source-IP:X-Barracuda-Apparent-Source-IP:
	 Received:DKIM-Signature:From:To:Subject:Date:X-ASG-Orig-Subj:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Barracuda-Connect:X-Barracuda-Start-Time:X-Barracuda-Encrypted:
	 X-Barracuda-URL:X-Virus-Scanned:X-Barracuda-Scan-Msg-Size:
	 X-Barracuda-BRTS-Status:X-ASG-Debug-ID:X-Barracuda-Spam-Score:
	 X-Barracuda-Spam-Status:X-Barracuda-Spam-Report;
	bh=c6M7zUWbYVANbjmGUbha/Z3ro0y66KsdaM27v9ymhms=;
	b=mzpPrTQJ3blO/c9DTbJciJZ0HxZgCSSYep3d/5mFnqsuGHM4JgCfq8KkazDheSomwVJW
	 WnyYjtMCPI6S8QtPsKxKbs+pdOIdXXMiFUvC3bg19YCJVG2mDxAfjlR2MsFRkbGqQckL1
	 anczBDtSUpo6qkcG4MoEDejB+uKNWlAc6zmdUg1Ch4s5LlhefRTgFP6E2bUJIT9RHl6gO
	 2e/0957Q1lbbEA3Koxyk9ySPm/C3L+Jk+GDMqw9M3DLOTC9dr2qFdvdd6hvAKMSLWVgvO
	 Ezx1LGCfdaHiwJ/qLcYeDFLCIRowhUMPfrk3U7jURyRKu9xR3LlwzlKxFD63J2SaftA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vandijck-laurijssen.be;
	spf=pass smtp.mailfrom=vandijck-laurijssen.be;
	dkim=pass header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be header.a=rsa-sha256 header.s=default header.b=WLGw4Iij;
	arc=none smtp.remote-ip=212.71.1.222
Received: from relay-b02.edpnet.be (relay-b02.edpnet.be [212.71.1.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA731606D7A8
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA731606D7A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vandijck-laurijssen.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vandijck-laurijssen.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be header.a=rsa-sha256 header.s=default header.b=WLGw4Iij
Received: from srv21.vandijck-laurijssen.be ([213.219.153.140]) by relay-b02.edpnet.be with ESMTP id CpUp8DXEVwGacedx (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO) for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:16:33 +0100 (CET)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: UNKNOWN[213.219.153.140]
X-Barracuda-Apparent-Source-IP: 213.219.153.140
Received: from fwg.vandijck-laurijssen.be (fwg.vandijck-laurijssen.be [IPv6:fd01::dab3:2fff:febd:d001])
	by srv21.vandijck-laurijssen.be (Postfix) with ESMTPSA id DD574B27316
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:16:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=vandijck-laurijssen.be; s=default; t=1794827792;
	bh=c6M7zUWbYVANbjmGUbha/Z3ro0y66KsdaM27v9ymhms=;
	h=From:To:Subject:Date:From;
	b=WLGw4IijKKyy+uvtydYvDThHfriHWl1FajjA3majTX4Q3/7M1x51Bae+BXS7fTlzL
	 IECwK9tA3zey/n5yJ6uWAstHTY4cp5kLYNrgJC130PbZXnb3iQF7I6NV0t+uqYlvs9
	 5I95wR0GtZ45U59aHpsmexZ295HS4yzFWyTroFaGWwoHdMnvi9FTcFRU17a0i4BizI
	 CbtjvVwehlT+TFlmCSQU5C0c4NCOn8X5ZwyWHsobStewBPX8nXUT+7deyHsp5Ah3D8
	 nCT7Ge821oRUUEq8u6GKuygAOHWFT+eVKQlpthc/ay6S0HViuoIXLn6uqSaKNHG4g+
	 Z3RYZDk8xRT2g==
From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To: netdev@vger.kernel.org
Subject: [PATCH iproute2 v2 0/2]
Date: Mon, 16 Nov 2026 12:09:37 +0100
X-ASG-Orig-Subj: [PATCH iproute2 v2 0/2]
Message-ID: <20261116111613.25820-1-dev.kurt@vandijck-laurijssen.be>
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
X-Barracuda-Connect: UNKNOWN[213.219.153.140]
X-Barracuda-Start-Time: 1794827793
X-Barracuda-Encrypted: TLS_AES_256_GCM_SHA384
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 527
X-Barracuda-BRTS-Status: 1
X-ASG-Debug-ID: 1794827793-214fdf6fb4135930001-BZBGGp
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=10.0 QUARANTINE_LEVEL=10.0 KILL_LEVEL=7.0 test= 
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.125474
	Rule breakdown below
	  pts rule name              description
	 ---- ---------------------- --------------------------------------------------
	

Current implementation of address protocols in iproute2 allow to add
them, and iproute2 will show them, but you cannot use them to really filter.
These 2 patches fix 2 shortcomings of current iproute2's 'proto' parameter
handling:
1/2: allow to use labels from rt_addrprotos tables
2/2: treat addresses with no addrproto as PROTO_UNSPEC

Original patch series: https://lore.kernel.org/netdev/20261113123200.17784-1-dev.kurt@vandijck-laurijssen.be/

Changes in v2:
* improved explanation in commits
* cover letter

