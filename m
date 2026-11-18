Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023828;
	b=TbubwfchgnpYiupwVA9xn7ODUOVlt7sZ8GfQPNA/R2Q05e2vASgXDfEA4Uj3IuJjRyCo
	 nHQ2ZykoqE2VH8k3tGdrCogwSl0BTwBy9rbnY8wEvqSFaI2Pl3IEd1VDEYira/utAaCVK
	 HjD03Y1stu4tTQktN01PTIOqTDeBsIWbq59nEUdbDgFVGgYR+YVK1MEtxNrlWpQrWgyrC
	 dDWnexOSSJIOFaZvYxCfV0WDUbrROzIXFgie7RsVmyfKO9deF1ttLSkW2KfTvdkqAgQ6c
	 Onq8CTUyoa3g0Qrpj5Yh63ZwFCvCxvDsUC0xePOvTHYv6iCI8njOT2nXG5bWko8rgSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023828;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L/JG2kVIljtQt8JbbY2gIgeH7gzLpxrJG2728cL2kgU=;
	b=AUffx9IqpNYX6h/Wlwk1onMRosOKk/zjMd2vAWqif0y+M39A+/r9HTDGQOcZA3S3qbAo
	 V16sgcauWwAQuZ66Jav8HFTIkAEK1syfnlwoyY/0R6ZtOG5JL8MCf8WtrYkBumROwpXWT
	 MfgqdNbZ48y/MFfq81z9pkEJYjG8/InK8VDprNdRSqdfbl1aebWlpJND1q44YILuFQ1be
	 YXkYYQNy7GZCUwLPhy00OVxwbYZPcw5Iu/j8lBknbMyT2ovuxfV/idGHOrSssS9fJgkTT
	 1zp602lsYU6/KXE0m2fMml7o69Ol9C2bckx4020dkuSp10VcQBVjh2EMWotNmhEHFLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ln93A87G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580DD606A32A;
	Wed, 18 Nov 2026 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ln93A87G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD37A1F000C4;
	Wed, 18 Nov 2026 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795023828;
	bh=L/JG2kVIljtQt8JbbY2gIgeH7gzLpxrJG2728cL2kgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ln93A87GjnCBTWrVNRokUdUeeCxDWSJDndnvASI9YG8Phxb2IMijf5GXzSJXR46M1
	 0jHYl/xX/GPJJybdhZgvbgKFRetIPi9xVFDIWewy1yjBp/HFEeA8tHAC8Gc78kmVfc
	 hQBtPy1lf39BvqwJSSSzm7szDRdCm9oXWVNpDqdKAr4glruJd88ctHgv/HvtT+we0v
	 v9wm7eWLDsh/TFmZVTgrF2q8tZBIte7o96P0rHbvGlRUOg30EyE2bMO+vIaW07KUi+
	 miuE2kU5fn4sgOK9VXFSQsVVEYHVUm3ELCegoChu7PR2jT3UtH877ZolVGZB17AAVO
	 pch0aU6E1qGoA==
Date: Wed, 18 Nov 2026 17:43:43 +0000
From: Simon Horman <horms@kernel.org>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	maheshb@google.com, arnd@arndb.de, kaber@trash.net,
	dskr99@gmail.com, linux-kernel@vger.kernel.org, yana06070@163.com
Subject: Re: [PATCH net-next v2 2/2] macvlan: fix RX byte accounting for
 local broadcast and multicast
Message-ID: <20261118174343.GN860048@horms.kernel.org>
References: <20261112025619.563195-1-yanxia@cmss.chinamobile.com>
 <20261112025619.563195-3-yanxia@cmss.chinamobile.com>
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
In-Reply-To: <20261112025619.563195-3-yanxia@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 10:56:19AM +0800, Xia Yan wrote:
> In bridge mode, broadcast and multicast packets sent by one macvlan
> are delivered to the other bridge ports by macvlan_broadcast(),
> called from macvlan_queue_xmit(). The skb still contains its
> Ethernet header there, so adding ETH_HLEN again in the rx_bytes
> accounting overcounts by 14 bytes per packet on every receiving
> macvlan.
> 
> Packets flooded from the receive handler have had the Ethernet
> header pulled by eth_type_trans(), so they still need ETH_HLEN.
> 
> Use the existing mode argument to skip the extra ETH_HLEN for the
> local bridge-mode path.
> 
> Noticed in macvlan during review of the ipvlan fix, and confirmed
> on a 6.6 distribution kernel: five IPv4 UDP packets with 32-byte
> payloads increased rx_bytes by 440 instead of 370.
> 
> Tested before and after the change with custom IPv4 and IPv6 UDP
> tests in UML. The corrected counters match the received Ethernet
> frame lengths. Local unicast and external RX counts are unchanged
> in these tests.
> 
> Fixes: 618e1b7482f7 ("macvlan: implement bridge, VEPA and private mode")
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

I agree that net-next is an appropriate target for this change.

Reviewed-by: Simon Horman <horms@kernel.org>

