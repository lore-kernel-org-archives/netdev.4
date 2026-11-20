Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213702;
	b=vz8EapM8UdNjERLAN83Di0ePYBL3zOTqxEUvzjoPMHFRevbd+yhhj70dzmbrWW1uXTkx
	 2sjbbaTJJZpNxoXpuTYKan01DVHx2YO+S3JmGM9aBQq1g89i/N9jIWWwUvO3DwdBpZDeE
	 tPGRF6zZGftKXyewSfRHXmUyGPwHz/9vZeQtfdJxGH8iSrITkNysS5JuwjJA3jND1Av42
	 +wKsFd/X2XpghfnR9CjAufXGQLk71mexpPOhNnXziKM8iuSEcycV1ZUyERsSZTla3M4nu
	 G22Mcsqr9U4E/B6XkXItXCer6eLw0dD5hlrQhL53bsh+WX+nc2kf0LGCXbCfp+L8XsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213702;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1YfKjMFCTom41lEwJM8hqdUuYXG+ZqSXl2UKjer8G+U=;
	b=ch/3c/gvfG1lkcc9BIKpnUNRhJZZ7jRZk95En+HFt5pZNJY5w4uh15wFQeRugrs33x0H
	 59qPh0/zB2qYdmCAsTrLYu5bsYDOCh3iXiP5Ma6ELWDAzgnRRdZ2cK1jZjaX1hDO9ADWx
	 lokrrpr21ml4Wrdh92kaOgZzqP2kCpu22+cuD34qcdubX3Osx2lnuPrydvtIXT6nmbS4a
	 3wCRjbjUBDx0GgHaXTnQ6s2dkWqknBTrfNLriZtxrduDyUYTZcykDrE67ItLHzhVhd0bF
	 nVVoxYBFvS3mmclImlmADo7lFa6QjdWSCFNMO+U0YB5YtAAb7V1G3wVoMfPwFR3w7pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJMLQW0a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318FA606A335;
	Fri, 20 Nov 2026 22:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJMLQW0a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423C31F000CF;
	Fri, 20 Nov 2026 22:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795213701;
	bh=1YfKjMFCTom41lEwJM8hqdUuYXG+ZqSXl2UKjer8G+U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IJMLQW0afDIaMA4OQ2ZNjAzPT4pBqpP60wHyLyK69BaJiMb06Gd2x9fma873jckbE
	 ywf73xGbwkXh5QrnGQ9Sth40Jd15AOczQGTu6UpEGP5Q3Bcey76NZEUSzRChKXSmsE
	 97aULfh+qelpVVBB+W3lHChFeH59K7z+XhPtYZLOpe1iadC49VXptagBfKjTzhNoZD
	 OkbGFXSxmQDTL8fpJRYROCqwQAfZEg306ORL+Hd3I32PG6i+jHUwLDkDu1dHIcU8ef
	 ZVVX0Ggou3BcP02xSuXAKCbk7Zyi3NVc1JVz4FpO5TMP1bM1zgCghZZ3SiT97yV1MW
	 /t+Rb6FqyZD4A==
Date: Fri, 20 Nov 2026 14:28:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kyle Zeng <kylebot@openai.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, jhs@mojatatu.com,
 jiri@resnulli.us, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net/sched: serialize autonomous timers with
 qdisc resets
Message-ID: <20261120142820.434d358b@kernel.org>
In-Reply-To: <awDCQf7I1sG9LTLa@com-75606>
References: <20261110044450.51921-1-kylebot@openai.com>
	<179465832501.2199510.6314071993812416961@kernel.org>
	<awDCQf7I1sG9LTLa@com-75606>
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

On Fri, 20 Nov 2026 13:57:21 -0800 Kyle Zeng wrote:
> Thanks. I agree with these findings.
> 
> The patch fixes stale-root lock acquisition and serializes the final
> reset, but it does not establish stable queue ownership for offloaded
> HTB, serialize every offloaded-leaf purge, or prevent detached SFQ
> from accounting against the live hierarchy.
> 
> These are distinct, pre-existing issues. I would prefer to address
> them in separate patches and keep v2 focused.

Either way, you took too long to respond.
Your previous posting is gone from our systems.
(in general if patchwork says "changes requested" the patch
is not coming back 99.9% of the time).

Repost, ideally fixing both issues, if you prefer it can be a patch
series instead of one patch.
