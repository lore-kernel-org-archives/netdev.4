Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965037;
	b=nD3+DGGJz0k9x9j/BsTa+DzaEMs6Rz4VdhU9z9BVPxy8dRFng1GQnucS9IP1RGxXkjm+
	 qyFTzu4it8y9qoVfdMvx2aMSxH8qnRHxsjX/ruGKQCrh/OPHZbDKrwvj4nxFq42aIfD12
	 eeupwkJtCxiD6AnDGE+Mdlvrc7rOeWRWFC+vcvxY4atOhKKSxjOvIf1oD8U8tSRGFamvD
	 VLJMO5hv5rxWuHlPdM/y8YDwJgOhkYqFT4szXpI5UaFGtfQ9wyIoY3F+7hYJNv9YmINZw
	 EjgceBBl5bxC2TpvN9Yt7xGBeemMotlBE8XEYEEjGjpehF52exVHLVKOUPdi229S26A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965037;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Aeuj1XORvRNWwYZiO+GU+hpCMVTTxF/hdQNgM2s/vsE=;
	b=3Qkh/2LoQGUPr+Y/80V7seb9L86aLDGpyVCJ38vYrljoC0Uy+7B8zu0C/OfNwrMzjFj5
	 7RxYcqwXOMcnGWSZNzosA8HfoMWl3b+wo5A7BLykRllD+dDxlId28WbQWYz3xl9r4I00E
	 122fjcByycJKKRCArOXJzE98eG7bG1GenJbfP0xkwPR71fPkIuyDnWrnh0R/AFlJMCNfg
	 qAJ/cZupacSc2RzBm8TaEQuwr6x5pe8Nafxj7dkn0k/kS912SBt6U1Tpqm176vdPxBM9o
	 i6y+wFNA7m4kHgh2rdmNoQSNQYr7TduotRLJxFuQnA/ZqPYhzKcbj857Lx0wBBiv9Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZ5m22WC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC94606A31C;
	Wed, 18 Nov 2026 01:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZ5m22WC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7794E1F000C4;
	Wed, 18 Nov 2026 01:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794965036;
	bh=Aeuj1XORvRNWwYZiO+GU+hpCMVTTxF/hdQNgM2s/vsE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YZ5m22WCEHUJWjW4KadcCdcEHVajSTne9h8ct9PWsChMd5r+RzGqhPwZx0bG4HiV1
	 /E/s5pq9J8nS4N2sV8WK4cvBHTTN+LmctVgKyfu3Ghrz9tfRdjzdmVbPMhzslzeot6
	 o4oTpSjfwUzp3g2Cl6GUL8EPKTQz3c2lISxx0xeMAAh3wtPFdjSe9GxoLsmA4spd1C
	 wmb6QfjsQAhneF7YY5IWGXWbx9Ixg7PvYXud9rCMYky40K6lf4Qpess+UyC5tXnOsV
	 dMv30zvwMPAzi0G1TnffcOZqt/hKRtukalT7GXnkncdq1A8B/uR/9xZMm4x31Vfh1R
	 0wI5JXcIpPT4w==
Date: Tue, 17 Nov 2026 17:23:55 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Elad Nachman <enachman@marvell.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: update switchdev e-mail address
Message-ID: <20261117172355.5a9307e7@kernel.org>
In-Reply-To: <20261115174131.4065032-1-enachman@marvell.com>
References: <20261115174131.4065032-1-enachman@marvell.com>
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

On Sun, 15 Nov 2026 19:41:31 +0200 Elad Nachman wrote:
> Subject: [PATCH] MAINTAINERS: update switchdev e-mail address

Hi Elad! Looks like this patch did not make it to lore or patchwork.
Could be a backend problem, see:
https://lore.kernel.org/all/20261115110210.4a3f0177@kernel.org/

You'll need to repost, and when you do please toss "prestera"
into the subject? switchdev itself is a different entry..
