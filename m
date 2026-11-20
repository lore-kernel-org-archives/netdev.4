Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157196;
	b=Yu0WJLP3hI7amPMDJ0BYPmJrQh+OcGi/QHGMgjn3OfZJmg/2pM27mk571EbshRRTTuMg
	 XDDZpCgnVbLNk/vKng4JnCAdz76gzP+lySIhFBYUhBF5N4t7EQIk5uINpuYE7r/m4UoWL
	 2bHx9UKE9+0fHrWNC9sW6HQel248rT+/R71rrNxF0YU1Bw66vG0BWf/2iAUJ/FVJhB7Vm
	 zE7tOKL93u47apC1qsNe1VSrqWidLqtfekEya5lLBBC1+qb51IzUubd9KpN7jTosStCtG
	 F1b6ChZCd9zdscsygV+/xmL9hxPySZbf1ZIhlI8zfQmZ/2A5AdEKP1WXBKc//Kfi1aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157196;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy;
	bh=LypRvvjLWk8RDdr/AkndvryUWDje05gyslCn+t15j9E=;
	b=bTJkkC/T0wzhQfntFQLa27oNqTD74mO9JAfbxvq5DPKokJgsfZkJHzJdzein9MlKl6vn
	 jdCBpvZXNTaAhddm4LKWkIugIurrmMDI9YswFJTI18X9sb+vM69vzoWsT8A0YrTFplgAd
	 +kzDQQOjxcyt6pgdZVwWTWYSsNAc5V6Bh5AIHOZqqNXSZmfXMLQ1YWt0p9cSfb3uvV3ah
	 yYd0Ogi8Cqs77pXsES3M843RQZA+Su30h2O2vnPOaQoJ1hxm8Qdjaz2cHuzlDz10STLMW
	 RZ4QfUaGORKL0AhFzLqBNZ19fzh1QbeW0tl1RRhp4/fcups43I8CtV2YaSMscBsWJxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=BjSP4wjQ;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445C9606A320;
	Fri, 20 Nov 2026 06:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445C9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=BjSP4wjQ
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 51A8B207C1;
	Fri, 20 Nov 2026 07:46:34 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pt_GomNUjegO; Fri, 20 Nov 2026 07:46:33 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id CE8C6207B0;
	Fri, 20 Nov 2026 07:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com CE8C6207B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795157193;
	bh=LypRvvjLWk8RDdr/AkndvryUWDje05gyslCn+t15j9E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=BjSP4wjQFA5LYExELmxoJgukEQZ7DhnIgywhM2E8UGeCwow/p6mnkvvijsB8CB5si
	 1ztDhmxHJhtuJFx2+EmV5gB9ibincn4J2QPRWITXHDbzDgRYkOJvQoQT7Ex8JT98BT
	 YJmo5YJOShRTw78V7xB02u31hYwsClCpqn4OiPQy3P6Hb2sWzzb+I7oPahQr49NueF
	 5ozTRaArceMNEEMAMQ8l2vr2MIehz9UdBIM0E8fHRFPllpPyAJzYOt3rIFqx0y2MRd
	 tfRyDQJl2+5KKS1oVSE+ChgeCDkk0ewuxTo/PTZYaBcbgVoi3GjDk+4TfzX+lyGheM
	 wGdC4kjhHFKNQ==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 20 Nov
 2026 07:46:31 +0100
Received: (nullmailer pid 1665531 invoked by uid 1000);
	Fri, 20 Nov 2026 06:46:31 -0000
Date: Fri, 20 Nov 2026 07:46:31 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: =?iso-8859-1?B?Suly6W15?= Jean <Jeremy.Jean@oss.cyber.gouv.fr>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Ido Schimmel
	<idosch@nvidia.com>, <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v5 0/2] xfrm: fix IPv6 atomic fragment policy handling
Message-ID: <av_sx9bxaRqhuRlQ@gauss4>
References: <20261111231853.2504833-2-Jeremy.Jean@oss.cyber.gouv.fr>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111231853.2504833-2-Jeremy.Jean@oss.cyber.gouv.fr>
X-ClientProxiedBy: EXCH-02.secunet.de (10.32.0.172) To EXCH-01.secunet.de
 (10.32.0.171)

On Wed, Nov 11, 2026 at 11:18:51PM +0000, Jérémy Jean wrote:
> This series fixes two IPv6 fragment issues in XFRM session decoding.
> 
> Patch 1 restores upper-layer protocol decoding for first fragments.
> Patch 2 restores ports, ICMPv6 type and code, and GRE keys for atomic
> fragments, while leaving them unset for real fragments.
> 
> Changes in v5 after a review from Sashiko:
> - Patch 1: unchanged.
> - Patch 2: use the IPv6 walk offset for transport headers before
>   skb->data, preserve flow-dissector offsets otherwise.
> 
> Jérémy Jean (2):
>   xfrm: fix IPv6 first-fragment protocol decode
>   xfrm: fix selector matching for IPv6 atomic fragments

Series applied, thanks Jérémy!
