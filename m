Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135334;
	b=Q4eZnfrbrqrSrrWmPhFC7SlnnugXXB9PmK6O9qXF3yqc5Z13uZQUAyX+MvpX4tfvpmX7
	 V8dOMhsB0anFjqwp+x+tYsp4+rCtDdUpmclspfbONM4Iyu/xETGC4VdCTXrRJJwN0eVfK
	 8zlKCa0IlkHK8gH/JSK/Hu1zME/oPGijZF4tGHeLUC1OCWJ6ARFioKsrdntha8TIMfy11
	 7L+kh87mwMlESfC/GoQMQeTB9fchSis/ilK9eGDlBqj8kO9T1izKaurnJXr/SHHvrzcr6
	 tgNu9qe0yrDhnVh++UC3OmCLYJS8UccNrMPDSKhXpLyr4+QkYByzAHo9jwLbJInW/MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135334;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=R6IWQFNPeVJ31TwnXRv+npUxRI9bJNxkcqp3qsdjNeg=;
	b=gYXrkU2Y7sMA9KqGA5n/b1zzlhxe+MXixdCuGWwBVDU/yl9sFp9ahcue5ojFVpiGmqYb
	 xnweeBZEYnPmZbCoyh+XBHy7RWo7AtLxAPxV22KyJITgWV0zP9zB3XPcZwUFksGyJDPmN
	 nPvqoPe2WdlwPOIKmpgsBDl8bPP7p7XA9jYW/c7kHtji2By8ZSe9LWgFH1wrwdBKfDrpj
	 YBeflzk6DeEgQRyBN+5Z7oD5udRwpZcHMHmiNTO/kgvzlHLUHkHDo1pzxPV2wQP4TEjq3
	 MIdCYIuuWbO4dwMTXecHElOc5WLQpWy3v8Xoe9A/7vtnMYKc4abEr10YkTLROngraag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FdUDG1QT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3285606A320;
	Fri, 20 Nov 2026 00:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FdUDG1QT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EFA1F000C4;
	Fri, 20 Nov 2026 00:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135333;
	bh=R6IWQFNPeVJ31TwnXRv+npUxRI9bJNxkcqp3qsdjNeg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FdUDG1QTR2SddkVsCicqQ0xwtAI3W1ByCFui+mNJlqwFgmrDCbzBxY9PhkaSARMyJ
	 hv8qXc4l6iIZ2gqLIa4JHy1vcMhpW796ldjdoSAy01TXAFf8ptRPfF/+NwBq7rb0BE
	 +HlDbkxcWtMdoeNwUXixAVgYJ6K9QZL/0b7l9jI6X+6VXGYg83KQNiFpSUYVfh14cY
	 H1prkVvxjYgRE57uVpDnfnyyARyGAUybDr7jpj57G+RfJkrDUlZ9s66em+qafT7Gfn
	 RxGlRxuhhqn9KYzuGTAocZEPGynv7JXfYhVH+QmeZNmRt7G4gzpCZb65h9fJ48+smX
	 HUo0FB0lW8GDw==
Date: Thu, 19 Nov 2026 16:42:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "illusion.wang" <illusion.wang@nebula-matrix.com>
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 pabeni@redhat.com, edumazet@google.com, horms@kernel.org,
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v34 net-next 0/8] nbl driver for Nebulamatrix NICs
Message-ID: <20261119164212.1e0903e7@kernel.org>
In-Reply-To: <20261112094925.6098-1-illusion.wang@nebula-matrix.com>
References: <20261112094925.6098-1-illusion.wang@nebula-matrix.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Nov 2026 17:49:12 +0800 illusion.wang wrote:
> This series continues and refines the previous v28 NBL NIC driver patch
> set for Nebula-matrix m18110/m18000 (SNIC s1000) Ethernet adapters.

Please wait for human review on v35.
If you reach v40 we will ask you to go away with this driver..
