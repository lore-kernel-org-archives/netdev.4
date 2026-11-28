Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795835526;
	b=xomTtLBYCxn2h3wCo+QHTf/fKKZFO2ICzVY26hyVTLrEEpK5iotDQW2+qE5+Z7DK+vqs
	 zW2Y3ahJJklJ0ojBDOG407Yb7c6z3MOc7fnvDEW1KLum97a+S4Ibofi3CJLr0rExNrCDC
	 QOLhOz0PL9jIIo3Iw0A/qmXHdNqC2xvqikO6MUO/pI6rjUNenmZbxWWIs6OIKnctKQC/g
	 5Eg/E+7M77eir5il1zR839ejqaeMOadj/Gb0SHDR4IOOnZqAlK9HeSYINvVDriiGXzu9a
	 Ic2VLS+fFNrIz80zydk/4b2TYN5zWyKQklWrlQoqKK2VZUfzB01V4ntpaKPuIr9LwUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795835526;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=YPudr/Hggpmjs/xYzR8erBUxpfbvAuaUdr+Kq6Vp2tY=;
	b=CD0FTkTR7PEtdhGabzI0DyDMx8g6MhwLnAGOBD/WxHowD6FOvzbvurR/SMHPKZFUyfjn
	 twRahYcdxf0wA3HDfEVz6OJRVR9Mqv1agFkCC6g5Z36zwRE0V60XEzO+HtocXsOWQ8XmJ
	 R/rmejbhJDKB7PouccZlk3M4nVRyTVGGk1oATq9Ss1981VG3QjlwMWSy80FhiPaR2wfkY
	 Dvi/cG34DiDmz8sXTez5dGPwezC+Hz+POT983ebfzpHQJb0IrK0fkoa/xnmoIPWZ2cYVX
	 nGYggsC36Cjh6L7uFc8x0UcXEnyqwVfgr9+2SiEQga+q259hx2qKdKvPSDyAjh76mWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	dkim=pass header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=gw2610 header.b=OCNTb6zr;
	dkim=pass header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=cm2610 header.b=XI5uvqup;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70816606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 03:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70816606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=gw2610 header.b=OCNTb6zr;
	dkim=pass (2048-bit key, unprotected) header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=cm2610 header.b=XI5uvqup
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zju.edu.cn; s=gw2610; h=Received:DKIM-Signature:Received:From:
	To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	MIME-Version:Content-Transfer-Encoding; bh=YPudr/Hggpmjs/xYzR8er
	BUxpfbvAuaUdr+Kq6Vp2tY=; b=OCNTb6zrlhbdDzG4bBRfL23OGTnTFI0295/23
	5UCvN8kLu2yPLmfMm5xRUh5MCBare/prF+bk+tfGBRea2ZzYJBVBgfQY6d0B2LH9
	aPJvyKtWNaNzX/lR+/oPyJFH3dKRgYm91H+HHRpfViO1oCiqXigUpTScfyG5YwQl
	ut176c=
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wAHLYR_RgprNLI7Ag--.3353S3;
	Sat, 28 Nov 2026 11:12:00 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zju.edu.cn; s=cm2610; h=From:To:Subject:Date:Message-ID; bh=YP
	udr/Hggpmjs/xYzR8erBUxpfbvAuaUdr+Kq6Vp2tY=; b=XI5uvqupYWdTgH3rYH
	9Qc6VRkNh0kznYk6R61ilK8DfmUM4Qvipd+QT+xgOkP4xZ2+c3yGM+HpVugl3EEl
	VVx81hyyzD1Fe5BVvu07yi2nMZ0ar6GhktoCJOghZJSMdJx5qcbhb5DmzfceUdcz
	qEdvuzoc/loNT+CdqJego76ZAxNAE8sNJNwc5foO7DcXaYnnoPW8pJNYs+O+tNJ+
	nhYXl75wlsL5Smue+OYkh4pytpQaiztgOIcsmCcmYlPOQLoIuGU76lVlscP377mG
	SjD12er7cFP9P1USfPM0uzVC+9c48A9dgehw6SXMMqhhH3Vx6IaycYH73Hycjg/j
	uiMA==
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app1 (Coremail) with UTF8SMTPSA id yy_KCgCnsX5+Rgprgyk1AQ--.12069S4;
	Sat, 28 Nov 2026 11:11:59 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: Simon Horman <horms@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	Lin Ma <linma@zju.edu.cn>
Subject: Re: [PATCH] net: rxrpc: Validate RxGK security level before allocating context
Date: Sat, 28 Nov 2026 11:11:02 +0800
Message-ID: <20261128031102.308036-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125145018.GX31322@horms.kernel.org>
References: <20261119030622.1017012-1-linma@zju.edu.cn> <20261125145018.GX31322@horms.kernel.org>
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
X-CM-TRANSID:yy_KCgCnsX5+Rgprgyk1AQ--.12069S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flABSs4
X-CM-DELIVERINFO: =?B?Vn5KaAXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGdgTuL1H8rZ2yYyUA7pDNxB4OTwODXeTj78V0xNx34uzldz
	QkKWFzlSn0HGzFdEYz2s+iEE9YgheSmT9Kw5/UWGOZ2kiOU0OJ0GvZwrfg0m+Q==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IE4IxF12IF4wA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x02
	67AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48Icx
	kI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
	43ZEXa7IU8VMKtUUUUU==

Hi Simon,

Thanks, that makes sense.  I'll move the check before
conn->security_ix and conn->security_level are set, so the error path
doesn't touch the connection state, and send a v2.

Thanks,
Lin Ma

