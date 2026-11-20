Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135037;
	b=LI6I2n82pGzRfOrOu1cookqr14P9WaElKRGIl3YiXl9xkcRlzPgGE7zo6PmqV8YqqhfU
	 rMIGwrRUOKcBe5etShyut0+SagDxC93nKowuVvPPgg8HDZ6Opeg+rBrtZ/Miy7bLFd9Is
	 z9+1UZDz0KWFSFWkdvcjuIXBjKGiayZlEe0SF3lNIqFcmrrNNQeRPt48Pn1QGYgxAA0iX
	 2oZ8OMG9Lutjen/3sdY7B1H91XAmLIkYZa+phz89EIaFxPHI3RZcmy3LsfnxVgxN/5LHB
	 LCxzisn8FXjE2/5PSBE1XQkI0j/9DlC3W4V7EvQ/uHJNaBNmqtfJrFtUCi7X3TjTwgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135037;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DrrbwINR288U3qg6+I6TMA7RnL3ZKyVXSMBbB2qtvqs=;
	b=R+0eP2zQTRzWUJhMlFbPmfnE3EM/9Q/QqWbc9N5j7iDJ8pFx1Kr0ZWuiEBuDZfEw3Jg1
	 taRL2YpucqhHrlFBc0uMhVQJYO2ia9sPnSGmVjeeu9jtuzWzI0du9jc/NYlZkgU9UVGq0
	 nsJUb1icrBYDmFPgu0H5hj+zPWueKu8zGGXCFms+6SGw3OwssNiptxODFqyTjU1I4HObs
	 B1N71Pi1hphgEclXWi7dMYzdEXUiqmhjZy39VKTXRcT4LDKyTy3yb8vEISjCasYEfI1zZ
	 ek6thWFF9OMallzVyKSYkp2/3TmxIGAMaPh9/98MUGPTjpmYxHgSEUFVHXj7VjPh4+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9s0xqiz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26399606A33D
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9s0xqiz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490EC1F000C6;
	Fri, 20 Nov 2026 00:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135037;
	bh=DrrbwINR288U3qg6+I6TMA7RnL3ZKyVXSMBbB2qtvqs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=K9s0xqizBH3Muaq4VDE/2AlSbXIpeuZBxMMyPY7xr7iR5oP8teF+A5GTxvgBofkVt
	 vMY29jjdepjGip4C6pwDnKq4DIeKVjqMFQNbsAg1Mu0zTfe+zjsaE9qbrNHuq1L8ud
	 RuA6tMyjsAo0aDjVhFe5pPDg3rQMxyNnhxeXWIJYKeyRmn70sfhP1cIP4dMJnppIyU
	 u59iGev7Yl75NNDgIplQQKtLZZ/U39DW4fclNzunN2fB0p4flzuyiFnI6Na9YM9zcI
	 zDNCP8hpkNFWvDNn3KiXSaGjl1r+IouRWqWX06esRxxkMior9XLc54gg6PY/pRuVOq
	 7ZGvuiPSmL35Q==
Date: Thu, 19 Nov 2026 16:37:15 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: netdev@vger.kernel.org, aleksandr.loktionov@intel.com,
 andrew+netdev@lunn.ch, anthony.l.nguyen@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, corbet@lwn.net, davem@davemloft.net,
 edumazet@kernel.org, horms@kernel.org, jacob.e.keller@intel.com,
 jedrzej.jagielski@intel.com, jiri@resnulli.us, leon@kernel.org,
 mbloch@nvidia.com, mschmidt@redhat.com, ohartoov@nvidia.com,
 pabeni@redhat.com, poros@redhat.com, rdunlap@infradead.org,
 saeedm@nvidia.com, skhan@linuxfoundation.org, tariqt@nvidia.com
Subject: Re: [net-next v6 00/15] devlink, mlx5, iavf, ice: XLVF for iavf
Message-ID: <20261119163715.6c40b7a0@kernel.org>
In-Reply-To: <20261117094913.100756-1-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-1-przemyslaw.kitszel@intel.com>
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

On Tue, 17 Nov 2026 10:44:38 +0100 Przemek Kitszel wrote:
> Also available here
> https://github.com/pkitszel/linux/tree/xlvf-v6
> 
> The purpose of this series is to allow iavf to use more than 16 queue
> pairs, in two modes: up to 64 and up to 256 queue pairs.

Taking the first two, as suggested on v5.
I think you mentioned that remaining prep patches don't necessarily
change either. But don't have time to review these right now TBH.
While I have you - you replied to two out of my comments on v5,
the most substantial about the shape of the API did not have a direct
reply. I assume that you saw it..
