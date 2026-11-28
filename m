Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833946;
	b=SYNKwdwcidUhioTwfoeanJbJLhzfWqV854uF0KbS8HYmIrZwAgEFBMW5bnuaIBfSAmuZ
	 TMoPOaYPU/rAfzYEe+oju3oYGL/8jdrcHEWrMt0frfMro7kLJEVsQ0NFo/vvykpO7//1X
	 CmasnLozdxui3cG1Nan1/Dwp4e+7FhKutAuNgnbS1/qtxK+kQyYEdh1DyGQti2wt69Lly
	 3Ygr1zthA+GtbQi2hPztYjWZUpULaN/hqOhiuclMzoJCSQHS9fZGBUPRdp4PchSOvWeyv
	 7AGMJp2A5FafIxEg69vNn51PK6ZpttGNFw+Q4T6zpcGCuJ8+WTaMlLseNwlYyOTeQMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833946;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=66tGL22Koa5lce0hPIesWC8bvqE7euAIija203qwS/c=;
	b=k3L7tRmDgcK9FjHcvRO8Qfbp/dK1Bv10MhMMSlUHLXtTmDOwViRyfaK0snj+LXIoGbf8
	 1BnTihqOv2GPopS/6KY78d/78fZxGck1wxEwUduG5kBPnZyGASqMd6KuHUqxNZPx82MMU
	 nyLmFAWOsnPuHRkfkS153vUI/xBG/7O514vtfZ2FJkYZuLlML5+1+DJB93txkJMLGyP+P
	 OkDZB7HW8l1P48pSVwGodFqJMJnL93BG6Aa1Kt88jFtGRHWndDYH5Loo4fWVBU5Qp9WdO
	 aeFPUA7cDqkbAo4Vx4tWaRIBtZtBktfGsgSw8q2wWGZ6UjYY39SL8791FLQ+57RPGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	dkim=pass header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=gw2610 header.b=HRe4jWkj;
	dkim=pass header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=cm2610 header.b=SRSqlr7v;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8563606A329;
	Sat, 28 Nov 2026 02:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8563606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=gw2610 header.b=HRe4jWkj;
	dkim=pass (2048-bit key) header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=cm2610 header.b=SRSqlr7v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zju.edu.cn; s=gw2610; h=Received:DKIM-Signature:Received:From:
	To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	MIME-Version:Content-Transfer-Encoding; bh=66tGL22Koa5lce0hPIesW
	C8bvqE7euAIija203qwS/c=; b=HRe4jWkjL5wVpW5fljcZUXhTTJ2/KlkOdsI/Y
	6bVL4sGuUB3lPO9cd0D9/3RdoEFCWYUt2nv903jSt0dQ2smRP7lwO7SGJ6rQ5x9B
	ns8snmEbu8cXGwklukGhL57JSu7IxpKKA+Qn5ah8TQWg2YbqlI2cUNY1gp19c1/I
	1zuacs=
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wCHkIVRQApr56c7Ag--.550S3;
	Sat, 28 Nov 2026 10:45:37 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zju.edu.cn; s=cm2610; h=From:To:Subject:Date:Message-ID; bh=66
	tGL22Koa5lce0hPIesWC8bvqE7euAIija203qwS/c=; b=SRSqlr7v498cO+iQCb
	P4H3UblRa/yJsFvs646H1Ukk8N5VZYo8b5PklCZq1ihGHTfZx8bQ/5Uy63lC+9Lg
	fDVhaqqlvSKC6VObks8UFb3Zfwo7+qNEr6TfzNK8d6vo1Rp9xYGEY3veRSkmDV3p
	WW1gBNG8z1MtWZEBazY9aehbDHttfAXduOYEbAKSk+aWOVKlizPt9T/u9o6leZ0r
	vOTAYemxZgUJAiK84qZMnw0n2FSTwwYoZue8Z0LFiTPLVvjtD7se4xWWGJtm6qcQ
	Op2F9bYFNTxDydpttJ6XM8lMxMmLOu7OKcl/DBNy+DEYRs8VcEgWAAEiNzmmYbcv
	FM5Q==
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app3 (Coremail) with UTF8SMTPSA id zS_KCgCHk6BQQAprg4WZAQ--.59787S4;
	Sat, 28 Nov 2026 10:45:37 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lin Ma <linma@zju.edu.cn>
Subject: Re: [PATCH net] rxrpc: Fix missing lower bound in rxrpc_resend_tlp()
Date: Sat, 28 Nov 2026 10:44:40 +0800
Message-ID: <20261128024440.306613-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122135515.3989708-1-linma@zju.edu.cn>
References: <20261122135515.3989708-1-linma@zju.edu.cn>
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
X-CM-TRANSID:zS_KCgCHk6BQQAprg4WZAQ--.59787S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flABPsl
X-CM-DELIVERINFO: =?B?IjXFLwXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGdX0QpdpWPnA1AMKbjkwmPz0q9iRF5NAEnPSDtS93KrwECZ
	ooyK9p6id9SV1t5sJxqkWTNJWpGTYWWvJAHV9mCu5AifDprSYigZeK/T6IVScg==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IE4IxF12IF4wA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x02
	67AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48Icx
	kI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIF
	yTuYvjxU2YFCUUUUU

v2 posted:

<https://lore.kernel.org/all/20261128024427.306409-1-linma@zju.edu.cn/>

It fixes the Tx queue state on wire-header allocation failure and the
ACKALL/TLP NULL txbuf path.

