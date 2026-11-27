Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768228;
	b=kHH4INsaTUml5TOErMYDFm7JyitSWrsCL1KPWtaqlkfaYZomEdcI1JZHBDQ5APIYxZqP
	 PDSFp9CQj0o8YrZ5uyrio9LvK+4ffclBufak3Thtq4xWoPT9gGSgw8sL4s8uxvNg5corE
	 tfLlqLd3UXqqnOT6L3QiueKO43R9codI9SVz6nfi2n8p2Rz4XIa3R8D3+Al5sid9KULZ5
	 zN6bLibZV30PfdMmgsjt49Miyx4Vvycreztikr/NonCdYrtecW5aV57c/diJCfqaPSAr3
	 zx4jGeeGbdr0zbJeyJD4FM9EautMiF2kHT0/QztwHUFA1i6EimH2hZhI9Oq44U0D/SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768228;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Subject:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AKThJX91BYarCRMVOvVT6MImXsfdSB+lOy2hqZ28X4M=;
	b=vrwuDCbA6X9id749CkNvwp051FKvI3MlvUwv3ce5o1/L6ifI2Q9g/xAhOCGozFldogE3
	 ioCfVISO4pGxCZ2ccUGYT8lMJzDoMKQyARLWD/SI2jJNqQMsoMoN121CUTSE4FIwk/tBA
	 9CZygG40w4EJRl00SSoA/H6I/SLUNo658LOxNgXKwCjwdpObfnVYHFf9IQR1iowQXCTIx
	 WKyYaEXQrGv61iUWjJAcDC9id6CYkTw6O3GA5R1gV1Bu8u7bJlg11yUEWDOqI9hFKieS+
	 RoPmr5/wV+lgt2vk1X9RUlYPT4VfQaJMg7WFqZvVGApYeDlAKA8/s0UF4zdif0sWKpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a0gNoceS;
	arc=none smtp.remote-ip=95.215.58.181
Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45580606A324
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45580606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a0gNoceS
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AKThJX91BYarCRMVOvVT6MImXsfdSB+lOy2hqZ28X4M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795768226; v=1; x=1796373026;
 b=a0gNoceSi6h3QKaWXx4dDNIlv7MoH1lXGmHi6z3epHs2z941biGMinknTnjHB/Qb0FRzRiF4
 bLITH6MEYVEQUBvZpJcNFvcOGodIsugEyTFsOvuyCC4yuQ/A8tS9FLjOXF03nLs/l5kv4Y5YPOa
 DX8Bs9AtmPPi0QzI7ThcbgG0=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2066f3f9e958e4ee;
	Fri, 27 Nov 2026 08:30:24 +0000
X-Mizu-Trace-ID: 2066f3f9e958e4ee
X-Migadu-Flow: FLOW_OUT
Message-ID: <9f5190b7-d19e-4733-8592-376de788f25e@linux.dev>
Date: Fri, 27 Nov 2026 16:30:19 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: baoli.zhang@linux.intel.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 jamie.iles@oss.qualcomm.com, jv@jvosburgh.net, kuba@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com
References: <20261120130814.2131659-1-baoli.zhang@linux.intel.com>
Subject: Re: [PATCH net] bonding: fix use-after-free in slave_kobj_release()
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261120130814.2131659-1-baoli.zhang@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
