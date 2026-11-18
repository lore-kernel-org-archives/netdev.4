Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013368;
	b=wRYx67PHAtwrHe8SaL45kMPPttsg731dBCpmmzXWxXwrqRZVvxsGuT18hhh6C/jf+cEd
	 xhOCztmgoTZ5y8lUCt6jGznhoL24Hcf31DhFWxQbXG6O3wScZnBqjWVnyhWAtSy1HNnzh
	 yVFac3XvMNQKml5zGghrFXiBWZFEjCNO+8/vw3o+W8VRYd26t45e6t9woQsmFqptiVo3/
	 AUhUXzFqW+SNut/pOZSyvl3FbgyqLQSqraHrUB7WGJfO2UEeLf03/N2QqW9CfslZW8ljz
	 sk4xtnEoODCMbTrMW0+/YMAdZKfWiPbOTMTEKaZea5qUl0KkcJERd681OW6jls9n11A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BYcPcCyuXaGPcw4Sps5aRqIsygn9wJni60rOOIJDu6o=;
	b=QXCRzgx7+1hiSxgB21Zkc0tDf3bxBH4Ctm/a3L1U2QXS5NwS95XfPtjUobLS40wDeiM/
	 f94kNH2610O49D02Zg2cKHOay5H7FsNTveW++J9lMh2/9TA1KFtxJPjRXHma57GIvaqly
	 ar04jIf9/ZxLHzTp+2oGsWCJMlg4JvB10F/70nQCH12g38ZP4cyGQL2+xmq5UFS4ITz1s
	 5Qaj7A+WZg52IwyQsyxFedl2aTsSYxEi5Ond4RJqgyQZFQQZRdgbOw9o3ZpGLQkBRQwtJ
	 P2l9DLlbtQ/WOePNMV9f+rXUydQOL+3tNeUKIPEwpACpk59yVBcQanXD4ZJZ42DR5aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ka70EADD;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE867606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE867606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ka70EADD
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso592086a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795013367; x=1795618167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BYcPcCyuXaGPcw4Sps5aRqIsygn9wJni60rOOIJDu6o=;
        b=ka70EADDZbBXDDdGF/x2AeYZsWL4ifYBDhKgXDeYTFIEXp6edCjkZmi5qkKKoc/6BZ
         VB4yQGqey7SYvuZ8rKQWRUrXiIDcM8m/POvwzuf1+isVpDkTYHcethGUF8I7pgaF0mfK
         2u9EJgCmC/IAVrK6Q+jeUFyJbX/RCH9eHrv/tLDsr25IaGDXb9k9T4vQ1nrV9r/LMc6X
         IAb33TSpa88eMVi+Ut2j5V3eFAhLreJ0UOEGIYR06u0QxRt+T207ZE6oq0DZSo4rAvT4
         0+liuU8iwlsR+1dygQE6pMPqjyDbAXgy+6lopbmR1oL6EXBlVkD2F22yv0J04abt0h/Z
         21IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013367; x=1795618167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BYcPcCyuXaGPcw4Sps5aRqIsygn9wJni60rOOIJDu6o=;
        b=qntqxcWWm8pIlYJLMwoDstP+4Jgr4n2W07k/bni55ca3GtY6BzgCanRZ8weKuAxD6w
         5pj2nau9D2rmNzuIW02pJ2qflddqB2YJv8ZdMfy87rktuPD7+QaRNPN1b7DMA/fcwRdf
         UfkshRV6/ZNGPMpL9SxgoxsYsng2m3Wnn5LF5fabI2+rHbWnJmJVSMuMI4gRRFR9rnN1
         +fYqUUkN9+jrP2UWhUivcDgL3b5+DeauH58ZGnrQbtbR5Nj5LSr78faTRvf7siWBIQ5L
         TZgqhT/puj9oEruj71AE1GEQrJDLc70GTJ3rwUbEgUV3MBHBS48rJOdDpX2346CbxL6Z
         TfmQ==
X-Forwarded-Encrypted: i=1; AL+hErF5XwNjEctDskzqPciIls+Qeu4sExLtOvClBbsGMqjFwl6wGMuEnBHNHdt3Twp78fLNJ3tYPEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C6/wVoS1ermMd/ZlBVdefFm/kKVik6l5TQauHflyr4AWSa8pY
	QZ25w3m0O84L7k+c+z02wAbQmAhdJZY2RtvthKBFZN0nU+USmd09zxAFqqqABIkZ8Mk=
X-Gm-Gg: AZFdTZd/KzuetEtXypErNlo4VxswwZ0236jWUjZvwFJzQ/21UyxMCF5MPlt/9/kF/o8
	MLnVe6V4v/Xhu3B+ethUywvXmuwrpzG5jla/wr/Mt9+G0XkkmXNc8Oq9sQQb+Om8ZT8C74uSCmN
	E2CgcTNpeUzMRpdj8yfhbhgOk9DSXSpmTD9wpM0FyOz0VeNy+StlrzdU/oFMffNn35qfWSsY71m
	1HhzjQsyLJ1GczTPhFJbqBfxP2soOHeURonOe+kFeqhpUOSXlzMNjrJBpA82DFyt+Ws9SCRocZS
	iauoJTLUF1fCPaB3XcMQvQVJY2rOwjFd59h5Z3VxmonqiKgoGSFBT465kfkV6qIlCmjvpWI1NMP
	92jOnh2wihIyo45zsYnlbE9USu9nQi88bY66nVvlfam36fqsKvrBJTAxEP/pPLAGrOiFmPkYbbT
	zAQBtfrjqGNI1blghIIc9AutJwDNQ/3VXNVc4z6x0OeLkE4edG/2TfCGqflRkUJE/O4TZJQpbZ+
	PAv0pzNZZy13msyV7ax0U1wm6mtMVctilFGJImNUR6jFAeX61qiQiMU/d4rwK4uCDd2OIB7oqVM
	PwtufQX96LJe9+/DxuOCF0scbeflWVfqQfCd55l7iJw=
X-Received: by 2002:a17:90b:384a:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3b3d07e3772mr1728966a91.26.1795013367002;
        Wed, 18 Nov 2026 06:49:27 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:41::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d143d69csm4697610a91.1.2026.11.18.06.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:49:26 -0800 (PST)
Date: Wed, 18 Nov 2026 06:49:25 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, michael.chan@broadcom.com, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, pavan.chebbi@broadcom.com
Subject: Re: [PATCH net-next 3/6] eth: bnxt_en: allocate per-queue SW state
 on the queue's NUMA node
Message-ID: <av269expBpYxDy+6@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	michael.chan@broadcom.com, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, pavan.chebbi@broadcom.com
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-4-kuba@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118023905.3050661-4-kuba@kernel.org>

On Tue, Nov 17, 2026 at 06:39:02PM -0800, Jakub Kicinski wrote:
> Allocate the SW rings, agg bitmap, TPA state, completion ring
> page arrays, completion sub-ring structs, SW stats and the SW USO
> header buffer on the NUMA node of the CPU which will service the queue.
> This lowers the cost of cache misses for NAPI fast path (and xmit, for Tx).
> 
> Previous change already allocated the page pools on the right node.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 87 ++++++++++++++---------
>  1 file changed, 52 insertions(+), 35 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
