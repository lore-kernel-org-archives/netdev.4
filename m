Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646890;
	b=I8WCZdD5F+ScfoiA9+XhbxWI/R35wqVnklljYAIj14FoeFFHESkLDPa+eTWrjfnYRlfs
	 0pN/y4IhAmlJkUe6nWX2z2Vt1nDLUX4Ji2NvqAlnYFSelyO1MGENI9ciuMFM9Fst8rEcW
	 7HvlaPa9mo3Ps4Yk/M6bjj0CqGCtAQGo1kmjprDZq//slD9KnStJmityh/PDtkrA8wfhF
	 LVDVqZBO93GiINs9uHwCYUDzZsB83nrlP6BM0kFDgIYFGOUPqO1U9ae/CDFpIIVyzakhz
	 rAVJOCX1n8w/7PvEIgz0AvJAOSkg6N80JPKDDYDZ66jnUNBimJTwqfpbv6ROxTpKWLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646890;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=XTU+vLEVKALo0xt42XXIXH8kWnlwIgoaLjR4ciutv32KHYeRbf23gzTxVBzLznS19oWt
	 C1p+E50UuIJpf+b1Ww5hqL43jX1SWurBuaim3iV4PGmCv4iVIkqeaukQXsOfxIqlMokOZ
	 us9JJF9zN1cJdMx92B9IAL6w3WpEB/KbhmnMpi5VRaFWew068i8ti5Da775Ak7Ll1puEz
	 okeID/6YSv3NaQ9qJfFilHOin30MgLeruzNTritfquN8Mo1RHW9jKk0IMLhz4tsXa7Ky4
	 HscXVmdWGJXKlwFbEqbzuvKmVZ514zJSg4rv7yspoUtznsR+fLPcDs8xaSeoj46eeHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpqnRphu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414ED606A6B8
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpqnRphu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACF11F000CF;
	Wed, 25 Nov 2026 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795646889;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IpqnRphugbz0IsPQhNh0NReWGmoCycqBKhGoh+fECfEgKUIEf3WsE0BSyFthch6kf
	 OC9LmV+l/rIrIvpR1R4/SLMLqDBUL0QT/iUktSOmBtV89iumvx1D3kW23zPuJ9kpFO
	 +kQCjgKZtAucZakO45lUnZHM7E+nOWxeT1fa5BmFPUt5GEjoFZd5tZMYw0P9/cNvQQ
	 hpj79rl2gy7kjcqHKnt00C8ZWVeliDD0l1GBB6QSkDgTyp0kdofD2KSQPm+fV3Ux4B
	 fX2O720DgLR0r40R8RsOoRovHK6bVD1mf4GxdQB2HlZyiJ6vDir8ttdiK0VXrujo83
	 qCUIbgPfZt5jw==
From: netdev-bot+sinfo@kernel.org
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, willemb@google.com,
 netdev@vger.kernel.org, Aaron Ma <aaron.ma@canonical.com>,
 przemyslaw.kitszel@intel.com, maciej.machnikowski@intel.com,
 grzegorz.nitka@intel.com, jacob.e.keller@intel.com,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Simon Horman <horms@kernel.org>, Ayush Singh <ayush1x.singh@intel.com>
Subject: Re: [PATCH net 1/5] ice: restore DDP state during PFR recovery
Date: Wed, 25 Nov 2026 22:48:08 +0000
Message-ID: <179564688842.3294.18063823612588045366@kernel.org>
In-Reply-To: <20261125224428.4126195-2-anthony.l.nguyen@intel.com>
References: <20261125224428.4126195-1-anthony.l.nguyen@intel.com>
 <20261125224428.4126195-2-anthony.l.nguyen@intel.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
