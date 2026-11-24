Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520778;
	b=jFjFS/WSv42/uU3Y9QZ0jh0w7AvfddhS3nQbWe+JISu8hRaYvOwcAkvvwmX7mSoYwG34
	 cEVXT94+clkzd+x8FBylPFLs2Vx19VOKZUUB5xoppt94PxXdN7ucT+Dtewbxkt1ornLMs
	 mTvwZc67drFtNJWylqUmTuWKzAvPGEWMoEHhxCU8kRcgx44BicWX1YavxDVx0HHQ2DJGv
	 /2kzntJLRJ0AhM+kubB+NBlNLaWu7S71atmrUca3iJ8WWklbKXiXf9KBzAay3aPH90v9E
	 YnKa6vNZXMsK8MspOii9v/ZIa6tAwXBUXDJl090lZmQEoK1KQ0fWT3oWF73jJaN6P+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520778;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X8yX/Tper13zhYbbbIvCInGCzUoZkSmG4e3/2KoNl/Q=;
	b=N/c+61w9ykbrcIFx7SW5WFsGfoOtj0SoYWQppiTzEG4ck7TwF1V9tTRuLDSdgKbiHWpj
	 PtuV+g10233dzEPfmj4RUYqyZmlOzn3Bywy9TuKTtES7fsUERI7AhobFng+RItn1n111W
	 idwdtPWgBhgH+oFPn9zuAMgmdMRJnPAXHHNW1k5gYPHIQ5tza7XXw8SQybd11RojANfwS
	 01wUWktkbhfjSZxKCKOZZoKe6BKUgRDPcYIsGsyFvx1VrpSx3Uuu1Pc3lJRY9vTkYKKN4
	 w0sJ45cdyxOV9/F66SBOIplCZj2V2eSJ1zYgxcHvqeYMVM8twXbugCn9st0zT03u9CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n7Okynvy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A072606A33F
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n7Okynvy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5EE1F00A03;
	Tue, 24 Nov 2026 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520777;
	bh=X8yX/Tper13zhYbbbIvCInGCzUoZkSmG4e3/2KoNl/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n7OkynvyNJHWNjKsGZ1vPfQyUtBcvpZ9rT+un49705DhTa9MAo3ENkbsV2e5YlzwI
	 aBKew5Ux7hJbu997L8TLoSjFLKSHHcq/lvQIIL2D6WhSPo4vnnL+z2Of4m1q2Ql6vn
	 8AmIhx/2Gil5QHXxun3VaBbMcvVNU89/z9LTbk5ScZgrhAQrCEgfw0DH33Gk7Y8BEM
	 YinOOzKeweTZCyPRfuh3GgM8OyA3g7GofnTYu9IoFHjCngD8zaNuV7y/4res80qTrs
	 VyW5zOzAAtrXRLZ5/4asxU9iXmjpjuFIQ10TBc2OulGc/8kdjmN7TVILLC3QX3hmrr
	 LIZ3AbqQ9jYQA==
Date: Tue, 24 Nov 2026 11:46:13 +0000
From: Simon Horman <horms@kernel.org>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
	andrew.gospodarek@broadcom.com, davem@davemloft.net,
	edumazet@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com
Subject: Re: [PATCH net v3 2/3] tg3: Skip management FW version when APE
 firmware is not ready
Message-ID: <20261124114613.GL31322@horms.kernel.org>
References: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
 <20261118105408.1076095-3-pavan.chebbi@broadcom.com>
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
In-Reply-To: <20261118105408.1076095-3-pavan.chebbi@broadcom.com>

On Wed, Nov 18, 2026 at 04:24:07PM +0530, Pavan Chebbi wrote:
> When the APE firmware is not present or not ready, for example when
> the NCSI component is missing in the NVRAM, tg3_read_fw_ver() still
> calls tg3_read_dash_ver() after tg3_probe_ncsi().  The signature and
> ready checks that tg3_read_dash_ver() used to make were moved into
> tg3_probe_ncsi(), which only sets the NCSI flag and does not stop the
> caller.  The driver then reads the APE firmware version register, which
> holds no valid data in this state, and ethtool -i shows an invalid
> "DASH" string with a garbage version.
> 
> Make tg3_probe_ncsi() return whether valid, ready APE firmware was
> found, and read the version only in that case.  Otherwise just report
> the bootcode version.
> 
> This was seen by a user on BCM5719/BCM5720 with no NCSI component in
> the NVRAM.  With this change, ethtool -i displays only the bootcode
> version.
> 
> Fixes: 165f4d1cb3d7 ("tg3: Fix the setting of the APE_HAS_NCSI flag")
> Signed-off-by: Pavan Chebbi <pavan.chebbi@broadcom.com>

Reviewed-by: Simon Horman <horms@kernel.org>

