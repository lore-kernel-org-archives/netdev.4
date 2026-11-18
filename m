Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014333;
	b=mdkVKr++Yp/Y05KT/ydgiLmslkeFcp9Ch8oTNvRZkCJwmAQgqjAAH4C2kSQrriWqHZih
	 FoT8IW0n9xY73iquF5PbQ/GK0Pfhnk+vPS4mFPEQbLBdqr+eJyoB65nKgUkvAHvTztmvp
	 DDBWfhv6Z/rHq3wN8yRij4q1MjPoc5Yi0Q3i4bwQp90JvZknOVsFfPKJ6SK/1lGBVPVZk
	 oYZvOdMb6g4xeuT3SpORYGSV3lJ3Pk70YdOERxTdvGUtZSJ9zM102AD3kOyAjSnKhG2cz
	 2c98I0oEJdLZ5Bpa/ilvh0uDy1LS3AeqxocVAl2Ol2QTFNtXl7w5vHog2VNNjX8ATaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uHGZ+xOdJx3Zm8UTHiozAvdnroVoplilsdHtzudcbVI=;
	b=u6FCHPvX09l1kQTytRdoqYC1qzLJ9jC06ub8yJXYXtQn9kIx7i+a+sYU1G+vzhqLCBPu
	 W9BlfnGYgw7giOk0ygwDeHETv5d2j4KGseFEIlF+N5zVyKyQdXO3t36rpe6kUoOC+wMV8
	 1JY6L6kwuxZmnpDLmGAgOCXw7K07R5TmoWquDktgbCpP2fCVeXJ4q9VtSnSofOXkh/rsg
	 LkGGU3MqZU/lwMCj5h/CaO72JZs8bF1Q+rN3CXIRcaItVbIWVqBvNsiK1cDYno+NSX0oZ
	 DtrtT2WYetehzwC5ZL/8RRNajLpUMNQ2ETszCfNsJh0TlJRo5Lwu7ecASWVNm9Craxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QXFVnjhG;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDAD606A331
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEDAD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QXFVnjhG
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso8253025ad.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795014331; x=1795619131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHGZ+xOdJx3Zm8UTHiozAvdnroVoplilsdHtzudcbVI=;
        b=QXFVnjhGcWNcZVxAiqFpRMw2oMh2dieUZe7T/JOKGprkANq54ojUus6S8PyO67nOy9
         7UlTC39NR3W/6RA7E9c2wfG0J/51zw50s+bzNZQTCmKm6ZUmT/NgA+NdNMD2Ic1hJYi5
         0OlR6ykWIKzo5LTIh1NF+fqBL3e7M4NH30jvRTIhNCcBtmGbxmBLqqXFjFvyhLvrTw3s
         NeR7MtbWNK/lNqEVwgeZpoy/YIKH9C2rBf2lZ6NfRkjJbHNpTYBoQ6t2Mqu9aIHaaITS
         Wxop2OBj+7YXmP7hqs14tCALq2glB4GmongionzM4ZGaty18pR2LO4s5XD+nT2UwZK46
         9rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014331; x=1795619131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uHGZ+xOdJx3Zm8UTHiozAvdnroVoplilsdHtzudcbVI=;
        b=MssgnMZi30KE4cosP9ZYK3Gh8ujhz+zhgRNLVOUMsvNH93SgzBmHH0xvgpvpk1KShq
         l/ZJoV1Hj7mbTqUKkudln/kf3IHlvkNAqlppWJnGwAoIdG+841YgtrAhvHD9V8YZW/iE
         0+zE/V7RnLYPAtpFAm9v8229h0M87nEJB4IhtwcIoSzjEOhtghVdyVP0MNfwKxh8JLSR
         TmGE2DgMuhQ6Sx/wpDUbh+QUoDkkQ3F2749jx5rMxzaLdgH6XFU0Mnj+snYrgyQFePUp
         PT26k+RJDaUEJ0Msmn9YcipCOYtakfGTSckcHzpX4yXIm/KGu2A4upDzFeRsyPvJW7Po
         Jvdg==
X-Forwarded-Encrypted: i=1; AL+hErE6UIT6Xme045PFBKVY1cpLlL+mjpxsf/9M7Gop2ZjbljPLP1L+biQoYOor8Ap/iQuJOOm5ns8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yx5uMhrUYu2QQiqt8nZkP4f+vy57PsRzai5kEEI33plLGzzlm
	DpH0o3TMblBR7ZKIKJ32eTZIHDSG21ZQ8WXHjbXelyCYrWpxVLiLJgLXtDcJLJc3ZCU=
X-Gm-Gg: AZFdTZdLbm8mYkSNAEjRXD4Zcn2ApXeOlAnqZXoAM1e4vX5LAhVsVi12f+Gj1yJ5Pj3
	KIrCDC3PjctL6ZVKphQ+883Esbo+rghCGu5Z3I9Z2skr8qlzirYSb06gs4iJUGnYV7K2DFwvfqX
	37I623qRZwmh6a99uxboR42EKj2hOokftyPUPb1WNgumJKjqu1CIdOkAe1B9BvMQ0rOpmEH9LJQ
	edgUx1wOBwrLwW7usfFoAEFQtl0rYDXQxFb8ccyTEjUZ15iZQ3zfxtCoI8AntbNoILKGEfJvxLm
	GpUcqozPvYiEigGG2/pIBdG+uxVgJtX2IYEZm/4doWGRtboM0B08midmaxoL435u3xQSru9G4QG
	YDsB6Qh2t3XGkvU2deoXWUE7Vay3pXBk4WcGLTMX8CjIKkZqFrID0177bPb1VBRzeLtUhad9lLV
	GpDdCShF7Ixjr95vXR3vHp5TbZnVv8bUo45KztyG3jezHN68z1OVOK2xzADgSi/ygGTZ7hn1Z25
	6P0Tyi0eDgRTtUTF6izuUPjwAI3mQ1m5x4SOldlBZt12gvZ7pbn7wMI6CSu/NpGzqchozHjf75h
	Zl90h6keUTGkYLbTGcZ4+KIfD6XD0wxS7bS65X4WASAVH7Y1niijuKuRA/AHUR0d
X-Received: by 2002:a17:902:ce10:b0:2ed:2104:9a6f with SMTP id d9443c01a7336-2eff73f1e64mr28760675ad.22.1795014330948;
        Wed, 18 Nov 2026 07:05:30 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:46::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115f28sm15446135ad.19.2026.11.18.07.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:05:30 -0800 (PST)
Date: Wed, 18 Nov 2026 07:05:29 -0800
From: Joe Damato <joe@dama.to>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2 2/3] igb: link queues to NAPIs under RTNL after
 runtime resume
Message-ID: <av2+uVOytr5BDs5P@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Antonio Quartulli <antonio@mandelbit.com>,
	intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261116153041.3002666-1-antonio@mandelbit.com>
 <20261116153041.3002666-3-antonio@mandelbit.com>
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
In-Reply-To: <20261116153041.3002666-3-antonio@mandelbit.com>

On Mon, Nov 16, 2026 at 04:30:38PM +0100, Antonio Quartulli wrote:
> __igb_open() links queues to NAPIs with netif_queue_set_napi(), which
> requires RTNL, but RTNL isn't held when resuming from runtime suspend:
> this triggers "RTNL: assertion failed".
> 
> Don't link them in __igb_open() when resuming: do it right away on
> system resume (RTNL held) and from a work item taking RTNL on runtime
> resume. The links can't be kept across a suspend, because
> __igb_shutdown() frees the q_vectors. These are only freed under RTNL
> with __IGB_DOWN set, so the work item checks __IGB_DOWN under RTNL.
> 
> Tested with the 82576 emulated by QEMU.
> 
> Fixes: b75a1dea500f ("igb: Link queues to NAPI instances")
> Cc: stable@vger.kernel.org # 6.16+
> Closes: https://bugzilla.ipfire.org/show_bug.cgi?id=13562
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
> ---
> v2: no code changes; mention the tested hardware.
> 
> Note: igc may have the same issue: __igc_open() also links queues to NAPIs
> (igc_set_queue_napi()) on the RTNL-less runtime resume path. We didn't
> have igc hardware to test a fix with, so no igc patch is sent for now.

I have an igc I can test on if you want to send me the script you used to test
this. Feel free to message me off list if you like.

>  drivers/net/ethernet/intel/igb/igb.h      |  1 +
>  drivers/net/ethernet/intel/igb/igb_main.c | 38 +++++++++++++++++++++--
>  2 files changed, 37 insertions(+), 2 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
