Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131265;
	b=T6uaXTeLtn/0HUm3eLhIGgfXxyJ73Bh+bCsDMOYI+VXNmwrkS09fahopyj7aHSp0cAta
	 cSCIvlInGAd3FdhC9ax/Q2KXldK5S4pPE/xpGv76hk1L+U9Mnysox5kgW9yVlB0H1FPrY
	 JzZO6rvfk6O9zrQjv0vu+VRVWcSRyc6SO0NZ7UY40SNutA3DelU5M1/OFvdU42d+uBh/w
	 c9mAytUhjacxsq4BJSkMax1iFP+JOCOrVG9NeHT3rzDjPYW0avz1wyWJMehLuYEkCAKVA
	 gsH5NvpvIwPkagol9D1f7fEHJkfzWOxpNKaEfEPWygtuF/Ir1AePe7yR3ryksjZgVjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MI7mnbWJtqOFjuPsaAZSAnv0rdseJZ3T3cjclMQcElI=;
	b=bDUWoUQ9UHR7aMbXEhmcMbo0NT9wINLII9gD+D9csEyKdlmM1xHHLF+eghBmx1sBVoEx
	 vqnRcUSrKihbAZ4SRdA++LOJLo86/fzVovF/52PwX0Pml9yPZ2H7uoEuA/fYb8lcCGZbV
	 /xA6kjaUFOkr5xUXK5r16nRS6IOiPKHtu72Ka0mCXclYoNRwb7vr/W4dF1Sp6L8wVoPeO
	 Sp1Vf7vWtacmasU3vuILox+foU3MN7CHzZ/hdilSjNrtdPaqbeEeNaiJbS6FnYtFxknK5
	 6SfO4q00TUGRgNpobR8N0Em69jiSh6o9nqnDFitEWnlaQstEF1khC2bZUy8NvCFr89A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Oxm1d/Yy";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7AF606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F7AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Oxm1d/Yy
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed0890476fso1651795ad.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795131264; x=1795736064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI7mnbWJtqOFjuPsaAZSAnv0rdseJZ3T3cjclMQcElI=;
        b=Oxm1d/Yy+28cDfMvo3cUdd6Q0KgD2KJbd/1W0J7vt+MiDkUiRqER9fvsEzv+rb0YQE
         7lgbjx9EmSH8g5MAOeV/k5k30wfsdCtNgmcqlomxqYYO59GNzlQ1QPZ7U/CLX2NjTzAG
         OLDWZLAaLHaYBg5cUxZ6LPDpgdcA9ndXwY/DH36hSxWd3KBJzaBgMu3G4qSQFI85bRAg
         xIK9VYJaXva8sAgtS5LlOHC5YgOBfjnTW+TLo5r3Ad5gQatczb+5QUKf+9GXAFT9sXE5
         tzcGPTQ5O6Ax+i2Xa9TTQE55/BvYvkCErY8E+r7i55kE0ahKFGrMQiD0wrtQhYhwhrzc
         j6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131264; x=1795736064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MI7mnbWJtqOFjuPsaAZSAnv0rdseJZ3T3cjclMQcElI=;
        b=0+ZG9T8HGbRsdqm36lftsLs2GxaQo4F7SpXbbxAJcp9XIHacKEl/vbhi/T0/sAVEG1
         Ou8WXpHybQ2yxLRkSsP3F573IemfokCQ4NY71UWrFrTrF9xThYsExJeBMFznLdkmaS0U
         BvUfNsKeUZlvM2rkt0BPTl3/hqNLBTUExyUBiBO7pX8BY30YiOlba1x2qhIucvIeQxfd
         I4NrHJWxsetEbjo9VnGQPeCsDGTsL7iWQTUmuo4O4t9e9IKkT9d9I0KogJ6UdO0nX9VS
         QWkEoxx+p83CNwAjsw8tMVRevYVORjY/2jzguykz7rxxiy2OGXZcccH9VUKkyBe19r4x
         fxGQ==
X-Forwarded-Encrypted: i=1; AL+hErG04r5ch6tyvdpKIs4EpJsU6RLklRPchUCELnTapUFZf1cM56yEznLsrL2cnjU6cqccEc3CLao=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YFyB0hbVMDZ54tgSgxA/m4tcJEYRWNLs5/ghmw3oluoLIfecN
	xmHqdZlVed/Q5vINKLDQK0Qvf8iGNarW7LX8e1b1qtky+pLuv84aNKtr3Z/bvvsantQ=
X-Gm-Gg: AZFdTZdBRa00BrtcqN2SFMb3YDBFkWyaBTk5gdHP5ZqO+eVi0LaNy0x59y3H3F88GXR
	W2pnGRbfWAqIZFqnTSgbyY9EVBSNnZ9VKAQ5T1bKAxFK5yB1nN6DYBSyFRWQvMMl8F6zCzFTkiw
	V9Z5CG56lIpwfff/ayqVf8eq4KBg8owxBqyBopIlO1B/04URIuGrfpiPuzyqYZPVdBClhRua4Lw
	ywMbGqWgPE2Cb4pTMAEJE4aEQQrMK6zQggVxlhiZn+M0hT+U8eT3Y27dhkg0Sz01qyAgb6Kuh/s
	ytjgGMw7PljVfYxYaTw/amWtrepC6Jn19UFR42UJGprJA9Ds5fplLTBwSG2MU9BVXb1HeSyOMOB
	c46WE6jJkQOEQb0mA2ksAf37cixfP9/PvW482wg3F63UbAhUx4MjzlDd6kNxAecQsGyQFkRZONn
	RwovMBBOUkqj0RFql8teDQJmYi6zpkbOOyOT5tB8jwA5wuqG1nNlosDMn68IvrFHxQZ13bFU01y
	yss6fR2spFM85ejCFLNYMGCHBo//ZGE6m/HtKofMxB/AZOCL9prqXCzI+hciYaWBMZWpCo4IKKI
	bRpoFH/uVPUinYQeuUmZHgYdUBNNSw5OMyLmAh+U33srTZLGtyE6DusekfA7w4Uf
X-Received: by 2002:a17:902:ec8a:b0:2f0:446d:30cb with SMTP id d9443c01a7336-2f0446d312emr3115195ad.15.1795131264280;
        Thu, 19 Nov 2026 15:34:24 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:47::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0f8sm5686265ad.27.2026.11.19.15.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:34:23 -0800 (PST)
Date: Thu, 19 Nov 2026 15:34:21 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: tariqt@nvidia.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
Message-ID: <av+HfZSa40OFtF+M@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, tariqt@nvidia.com,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, daniel.machon@microchip.com
References: <20261117155353.2250540-1-joe@dama.to>
 <179493106742.3291.11434436383058043225@kernel.org>
 <avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
 <20261119143852.3bca9000@kernel.org>
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
In-Reply-To: <20261119143852.3bca9000@kernel.org>

On Thu, Nov 19, 2026 at 02:38:52PM -0800, Jakub Kicinski wrote:
> On Tue, 17 Nov 2026 08:43:25 -0800 Joe Damato wrote:
> > The only fix in this series is the deferred doorbell flush (patch 5), but I
> > need the other code (patches 1-4) for SW USO support I plan to submit next
> > if this series is applied.
> 
> Not sure if this is what you meant but this may read as if you were
> sending a fix for net-next for convenience of sending more patches.
> To be clear - that's not a valid excuse. That said, here, we're talking
> about a 10 year old error path bug which nobody apparently have been
> bothered by. We don't have space in net for such things at this point
> of the cycle, anyway :S

I'm probably just being dense and not following what you mean here.

I was looking at a local branch that implements SW USO in mlx4 and it was
getting to be quite long with a lot of patches. I thought that breaking it up
and moving some of the patches into a standalone series would make it easier
to review.

I suppose you are saying I should have just kept it as one longer series,
instead?

Sorry if I am not following what you mean.
