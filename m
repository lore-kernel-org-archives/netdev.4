Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157050;
	b=cMcXOiB/zP1YSFGM+lUYg41WAaXFesXQKJ/M0FjBRTZb6QMus9yRBtCuSuWNiZF2G4uv
	 Xt/a0l3IesnP5XgGTD6evCzQnhhzw+Iyz9k60JQnR+TJ6L6cdNhrK/ZT7jczPu8KmOtf2
	 HrGQ961oVnF+pz9Yd+bbL0eo8OL3YCDaNB1DyVrW1vlHiW6wAoyH2jzLchMMrfReoZHnj
	 942RKaizNsIk0uNKEQ+u0/yyht4Mn2FQXaeUN9We7lAkQQNEWso3Ls5Pb1B4DPunBwgfk
	 h/nGmPXwQRgiWFbfe9aMNbyZ0xRDGjH3GhVGGMbYkbK69hPT+3x1OOXjTCPJWjBJvYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157050;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=G53tqhQIxeiofQNabLLaQPq51Je0rYooi94QwrJ7XUI=;
	b=HGzKHhF+KZAupzdh9Mh4gvTnYb2+ADFlCEVen1jgs8exeyqEk1plGwwsepHD88eQpHg4
	 CYyggL1xDdUaexv9LDWmel3K56/svIz+q+URKLy8Hh91WOP0KkDb1U2vrGciLEZEhgixK
	 41JPGq8VeSn8x0ZCs4v3RNfREl71uuWR3UP2+7tM4OWbU5pNC+Foj1K7PsRMwvUGPZpjL
	 DcRQ3NInUT4a0M/jOUCUby74/TJqkmuw4pdvu7g+eswndJcBZe69aI5aJygNMhAgZVxmy
	 RmWVIg4zJqRmtdjSRxwidA54ZVhOSyn2NTRWky4whmt/qmVgcOfK6s0yKsUZ6o/frIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=YwomIApa;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D407606A325;
	Fri, 20 Nov 2026 06:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D407606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=YwomIApa
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 95F04207AC;
	Fri, 20 Nov 2026 07:44:08 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_03Sc66ltkQ; Fri, 20 Nov 2026 07:44:08 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 14A092069C;
	Fri, 20 Nov 2026 07:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 14A092069C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795157048;
	bh=G53tqhQIxeiofQNabLLaQPq51Je0rYooi94QwrJ7XUI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=YwomIApawY8xKxvlKsb+sS4CbYDMXjqqDIqrrj2G2HC3aVVhs8tUg2eBJSkTCEnCf
	 sLtStd51078rZ4hEbKf9ksQGNC5UBDb6f8TFzEFe9b4AN8NY30GncbIqs5xzyOXjo3
	 O6A8eT920nxnPwfGuR/+dvwcjF0ulnuqiQ7PVxEv5OjbSypBm74UJKWW62gz5BRaCh
	 XRJSqXJqSs143Evq1yaAFjG//Nnsxkh53vCf75b3yhGHz9kt01aKjXMpUAwohU7fCD
	 liRmpp6+uuc1riQvPiiRiQih67Au4l+DU5uLdflUDXuTBTdnQ3ng+dCKk++CaeWGwp
	 FSSPbzONQ0j8g==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 20 Nov
 2026 07:44:06 +0100
Received: (nullmailer pid 1662546 invoked by uid 1000);
	Fri, 20 Nov 2026 06:44:06 -0000
Date: Fri, 20 Nov 2026 07:44:06 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Yasuaki Torimaru <yasuakitorimaru@gmail.com>
CC: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<edumazet@kernel.org>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<horms@kernel.org>, <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH ipsec] xfrm: account XFRMA_MARK in xfrm_sa_len()
Message-ID: <av_sNleLx4XJ_bLf@gauss4>
References: <20261110114623.2659197-1-yasuakitorimaru@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261110114623.2659197-1-yasuakitorimaru@gmail.com>
X-ClientProxiedBy: EXCH-01.secunet.de (10.32.0.171) To EXCH-01.secunet.de
 (10.32.0.171)

On Tue, Nov 10, 2026 at 08:46:23PM +0900, Yasuaki Torimaru wrote:
> xfrm_notify_sa() sizes its netlink message with xfrm_sa_len(), while
> copy_to_user_state_extra() appends XFRMA_MARK whenever the state carries
> a mark.  xfrm_sa_len() does not count that attribute.  Only the
> XFRM_MSG_DELSA path adds it to the length separately, so for a marked
> state the XFRM_MSG_NEWSA and XFRM_MSG_UPDSA messages are sized short by
> nla_total_size(sizeof(struct xfrm_mark)), 12 bytes.  The other length
> calculations in this file already account for the mark; xfrm_sa_len() is
> the only one that does not.
> 
> Instrumenting xfrm_notify_sa() on an x86-64 KASAN build under qemu to
> print the accounted length while adding a marked state confirms the gap:
> accounting the mark raises the computed length by exactly 12 bytes
> (348 -> 360), matching nla_total_size(sizeof(struct xfrm_mark)).
> 
> Whether the shortfall is reached depends on the skb allocation, which is
> rounded up: xfrm_notify_sa() fails with -EMSGSIZE only when that slack is
> exhausted.  km_state_notify() discards the return value, so such a
> failure would be silent.  This was not reproduced.
> 
> Count the mark in xfrm_sa_len() for every event and drop the now
> redundant addition in the DELSA path.  The message content is unchanged;
> only the computed length changes.
> 
> Fixes: 6f26b61e177e ("xfrm: Allow user space config of SAD mark")
> Signed-off-by: Yasuaki Torimaru <yasuakitorimaru@gmail.com>

Applied, thanks a lot!
