Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699184;
	b=pxumnOwtFjuUVBBK84StiZw9jCqjkbBsaRV05eY0AP9uy5U67F32EKU2p5eaEDKia/pt
	 dg5cxv7gpZQ6zrY9X/bxzbTDR10JLvLqOzFrQCXQT/zumPGXtRCpFz4lOSkJN1d9p563b
	 hHSThWDkT2dzVy+tL7xvMPM1QJrH8uRSOcMZ9CqMryM8RpBsBNvX+08NGjrFcKYkslfyM
	 QiRH4PJOHe5cDHbC5l1trl+EtJ3ZFXsB3BIzivgvl2yio2zsJa8/GIHPWGEYwdgwVSESA
	 llH0qDPfPRRN2uhvjmuB+yY54mVkH6vDzagIv+g4LJF4puz6DbcQNZLtbglRKOCYcPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699184;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=agDhnbP3CCp9C/t2h9wSqMlGzDUR1p/xB3Nq5MO9gjE=;
	b=al7qY1854iPD00BOS06h35EqcMH9hWXb8at7GZh8fkdil12IlYvuCfRSudOndBPZD2Xe
	 6dFDxexilbtZ/pgY7Bl5Tf4O9Nnox7NGB2GO72hXIiSAcki/QiQkj+isr+DgW1lh+yVHI
	 whEN40ePFJpYmZzWqZRam30q+MQlGTcgBRTr0wp2MD4mLu3oeY0f3S5ai997N0pT3uoDb
	 s/298kqCqm5cwWd9CWqLxak2pjxOBfxWq49zFjQ5MrWt22NNfHQuXvuRKwFGfAPHMrEpS
	 4M/rL6lvAM3hcgoiziWZPxs7uwJhEIQZGq+VzPfcMV2XdfIWBCDx0eaSCRLasAeDT6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dfiWzIuj;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640A606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 13:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9640A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dfiWzIuj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=agDhnbP3CCp9C/t2h9wSqMlGzDUR1p/xB3Nq5MO9gjE=; b=d
	fiWzIuj0t0KG3C/5tQrUeLp/iqKsvbgag1wq/KsXxyU33CLeIj7NdMjVAZXu9K+O
	U2jEbap4OLLRWwUNdCxQPKSpbu2+c6yoLtvXLffOp86CKam5O8WAw7WB5LfUTOc0
	ZAYRq9h2EtO0zK7b4Gye+gUtV3YsdRqMBPo/VhCKN8=
Date: Thu, 26 Nov 2026 21:18:49 +0800 (CST)
From: fuwh1120  <fuwh1120@163.com>
To: netdev-bot+sinfo@kernel.org
Cc: enachman@marvell.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, serhiy.pshyk@plvision.eu,
	taras.chornyi@plvision.eu, serhiy.boiko@plvision.eu,
	vadym.kochan@plvision.eu, netdev@vger.kernel.org
Subject: Re: [PATCH] net: marvell: prestera: Add fini function under label
 err_fdb_init
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <179569276516.3294.7600196929784499290@kernel.org>
References: <20261126112825.3957800-1-fuwh1120@163.com>
 <179569276516.3294.7600196929784499290@kernel.org>
X-NTES-SC: AL_Qu2SB/qStkkp7yGcYekfmUwSj+s8WsO0vf4i245fO5B+jDzp2wUiQ25vPkvw1ueQBhGrmQOVexFv5eBnUrZ5caw6Lpp1LcpgRd+z59yrH7FrIg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <174871e9.9a33.1a218023b42.Coremail.fuwh1120@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cygvCgD3_4i5MQhrIKF2AA--.156W
X-CM-SenderInfo: xixzxiqrsqqiywtou0bp/xtbC7RlX9msIMbmkCgAA3Q
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKQXQgMjAyNi0xMS0yNiAxOTozMjo0NSwgbmV0ZGV2LWJvdCtzaW5mb0BrZXJuZWwub3Jn
IHdyb3RlOgo+Cj5UaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlLiBUaGlzIHNlcmllcyBsb29r
cyBsaWtlIGEgZml4LCBidXQgaXRzCj5jb21taXQgbWVzc2FnZXMgc2VlbSB0byBiZSBtaXNzaW5n
IHNvbWUgaW5mb3JtYXRpb246CgpUaGUgaXNzdWUgd2FzIGRpc2NvdmVyZWQgdXNpbmcgYSBzdGF0
aWMgYW5hbHlzaXMgdG9vbCB0aGF0IEkgZGV2ZWxvcGVkLgpJIGhhdmUgbm90IHRyaWdnZXJlZCBv
ciByZXByb2R1Y2VkIGl0IGF0IHJ1bnRpbWUsIHNvIEkgZG8gbm90IGhhdmUKcnVudGltZSBsb2dz
IG9yIGEgc3RhY2sgdHJhY2UgZGVtb25zdHJhdGluZyB0aGUgaXNzdWUuCgpUaGUgcGF0Y2ggcGFz
c2VkIGNvbXBpbGF0aW9uIHRlc3RpbmcuIAoKVGhhbmtzLg==
