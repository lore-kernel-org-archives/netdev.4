Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933808;
	b=nCk1MFKfSLHMM0NQTxatguoCWmrjJ06dPpLio6br9dnhIv6i/V3PwKtH+BSlJ5q8oekw
	 hY8gmvhuFUA9EQe5rbRtNd4wLPbDvTIteUR9VgUl+eQjPq70ogz8pj+7s0H7t5l3nQrRq
	 5npihqRUyngX1MeKqHRXJTJw+NSORIlVm0bQ2ZEWSzMrRt2oQC1DEyFTq9CAisDHeFf3C
	 lTQQ/8syPekspzjE5HwHtke82qTGop0yW4hXTd2mpR9SkilgBq1quQr0IJCn8STf9OVYc
	 ahZODY+qiugYe0LhBUCvyLOIYTa9ZfTPS1bKxamBE8sWyVHLj5nqRlTt5Xq0tAtTuew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Mail-Followup-To:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0efr/JUIIgLD0b1S3wAOzRoCj+AKw4Bk4eSMefVZLyw=;
	b=qnOwDCSuXpovftkmL8LFxVNxRpZY/r7LlMc3i0zcmgDMtAzXRR0NM1UP7G+jDPTWRxCj
	 mfaApMp2PdOsGlP976biMLKeSo2DQI4KWP9kfdGmNHogpIVPPGInZ++VO0bagqVIji4xH
	 J8tI3IeVisoJ3l+rkhGFe2H4inhJb/VwHXdnOlRSJyDSsH8udo2EIXpUGTuuZjkQH2/Zi
	 kzgpAsuStIQF79MyTWW8F9uXRKyDb88ZL9TeMfUQSl5GHCw8yeXEduTHM+4+FqezX+C0W
	 meMXp3+Nsq4+6LSHJVhceXGN9GNoGAiNpW7riAlbs+6+JA5fYQnGIzv1pXa6UAVkpIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OR4ma1Y7;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE2D606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE2D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OR4ma1Y7
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so3326472a91.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794933807; x=1795538607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0efr/JUIIgLD0b1S3wAOzRoCj+AKw4Bk4eSMefVZLyw=;
        b=OR4ma1Y72AX3KcOvan7+4WNvwMMwgvYtPZHJTZ5irPUQrkckqFV1T4JIA4dHr6ICsx
         EAS8r8tqd+R3V0C7yvCR5UHTtiqrJdmMPFOdJp/vm34+YdVYhUDlXTdaPaG9qCOiAVab
         2/BpcG/H36J/BoWInWKsr7zB+0jiH0gSmwgj7vNnjfwDAtSHNY9+n7H1wXvFUJoLyeFj
         5yPH3ynqIyj7/IcC1V68NETT/L5ztfdfXc6BGB9YbmTjaG0kHaII2/HWQHhC0ywFNA4g
         /SoM+WEUCubqThc/MjzilDes2AEvElroTaD9J/JaKfa1y1bfssc8pf46feJgVqhPCz2B
         RLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933807; x=1795538607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0efr/JUIIgLD0b1S3wAOzRoCj+AKw4Bk4eSMefVZLyw=;
        b=qQSyqpNShPqrMu8J0AhZHe2EXCbbpJgBozjO9tvv+tj8pPt2ipuSl97kkrdq3O2cG4
         rfphZC5Ba2axU0Ay3tl6MKz+I3PDjsqzJIbO7yTXCpnW+pe7j2jZlO3o2SnTiEnmOaL/
         otVPnl3p3DhMvEikN/Js8BuEU8z7Ykhv6W1/AnixS+cz9jF7kNK3ZIHyTpiHnJ9k+D8F
         PLeFlk8hCBoBPqs5GTMvQ/R/ovm+KPeldg4vZ3FFgKTxquHs1euRMFTTFNJkOXXNUxAK
         7S6kyz5Un/DB2hoZ7LJor9pvDJPYczUhvDIdJtqBb09CntQG3Xd5R1dMJTqAYAJyje3y
         vNdA==
X-Gm-Message-State: APuU4Z/D4sdcydin0fSEdJ9GQX6V9rJfkjuoajtD8CMkjaIncqwKZiui
	8FNiXIizg1pVygDPIhAKxawqJFMkZ74HqkusiFA1y0i+vJMxZxNOKoXuJ+N9M/xXXZU=
X-Gm-Gg: AZFdTZdFuaX95caPHSCVgN/Y8CUmoUWhDSWq/1FuIISSCLtDZVl7kUP6Cz4IFzDcUxN
	a5BTJ/GJShq0g+EyxHF+JeY4XhVGP6RyVoQpmjYlc8cuEe4VeOc4zC7FjWKbInZexHqm4sYK7DR
	estJuf+PD2Trcw+tU9RGURqrSgU8xJ4PB9A7NTMo3Qh+wdjNj1yTWPSCrcwDxCdDLOq3XiJGuP3
	/RB18kx5gNhFkKmw4P9+FciMx8imMDo7YebjN10x0qGX4qqcEwSJDkn8oQDMGGUKkSjMOgteqZS
	JnBw3oQuMFi+EwzZ/PlbdjC/kkptUsyR21g+S1BtiEQWJQ+cz8X7pZPrgy8fVBWUs6FStfLX1MW
	QUDg7672HUIk7lBRqrk0qDia9IKtGibzeiwqMldYo5f2YHIvNTnloY+iyGPpNIogfEL2ZYIjwML
	OVg8R+hk8cIbgzJZN65EYQW9BKKIoJaWycAeKAI4lNrWfOCFRCrkioZBdwZ046+WrRZhT9w9O4n
	yJE7xi2zZXPlNatA6lNGuMbZk3tHopZgJPwayIu18pmv9zwuh+ZhUdJuOsLiry2JPPU7j2oDnIY
	ZM3WjJ9X4nodGd+bF9bCSrBHSCWEf3GhLbSlHzGc3K0=
X-Received: by 2002:a17:90b:3985:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3b1b0b8775emr14549361a91.67.1794933807157;
        Tue, 17 Nov 2026 08:43:27 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:42::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm4886608a91.2.2026.11.17.08.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:43:26 -0800 (PST)
Date: Tue, 17 Nov 2026 08:43:25 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
Message-ID: <avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sinfo@kernel.org,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
References: <20261117155353.2250540-1-joe@dama.to>
 <179493106742.3291.11434436383058043225@kernel.org>
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
In-Reply-To: <179493106742.3291.11434436383058043225@kernel.org>

On Tue, Nov 17, 2026 at 03:57:47PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I should have updated the cover letter to address this, but I forgot (sorry).

As I mentioned in the v1:

I ran this code as part of a larger series that also includes SW USO
support on an mlx4 machine.

The only fix in this series is the deferred doorbell flush (patch 5), but I
need the other code (patches 1-4) for SW USO support I plan to submit next
if this series is applied.

Since patch 5 fixes an issue I've never actually seen, I am sending this
series to net-next without a fixes tag.
