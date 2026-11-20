Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212192;
	b=VAJqJ2aIPKw7okZvjrhjeoaYh3t5fmCUQcsY4RNso7GBfQVfRncBm96lUq3dYZLtH84X
	 UmHgwA27XGhpFaKhedtiG1MNpZcwg+KPErNGxqjdNCGbvfm4e7AlnS0oIZAmxuHOxN2S5
	 fYoLaPHZqU84XtCGQ9wvLSs3WI5UQTBjmqMjzURCIszvT78LIn0lASv+HVsY0FPXCQ9wl
	 /PcFiwizDz0v7EDP/WLFA5zQxo77Bd842xHD39VS+9JKM4jta2bjTKXP6g9ZzwQbqFWuS
	 OwUCLclUOdRXNa8JAZc8/K6SHUSF7QyTqKTz+5eMQLtxAqg6DY8R4w4jeqMmOv/ABZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212192;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=RFi6DPQJk+j5yD5miFSxANW1Q1l+eCEMorcIASPjJJwVG0Urf6P11OG3A0WkuWHyXmDd
	 V7UczPIoNBcUrQUpSt9XLO2YSSNFyjxEKH/uGYrFoQ2trymoStQMeF616F8noJv/ft5cX
	 1Lv74h3RRlopWaY/hx7nCcgYwkeCw+VLxosveTQ74samYeAPUX8T+truWPDj+020aN0R6
	 R5sb01feEtUFHyoL2EsQi85Pg7ZmOZXTtTM6DNYa+swc8LT7DYogTSp4E9zbiX3OOGC6p
	 fRXbeLgzdX8TiJXy+cw64c5XJI6HRCQRQAGnqBEAv51GZZMYFfxHI6pyzDuchQC2n7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGNiBwxK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925CA606A6A1
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGNiBwxK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B961F000C6;
	Fri, 20 Nov 2026 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795212191;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bGNiBwxKvBNarNBNQudHtlupKsHP+9Q7KmpePBBbl8ye0IUOqtjGjm9qK9veNeCSH
	 drd3N9ODrwZMcL4/4xRNZrJdLBkN4wFcW7Rfmmhyvv0f27dvDy6iXjS7tWaz9sTTcG
	 K0sxMTpmh4pIUOJdWHhfGlYcoxop2Wlr0H/V9X8hWxCXxVxCWX7Ee46i0aRCsd0QoP
	 ps4AXPZUH72gtFVTmNDCBfG0/HGpIA+pEmD4Cd1ivkimIaX/Xy5LJbeUCxDMMS3foK
	 edAY7RxrAXtsr7Fciz0v+ffqX9/APolo8qhnLHY9fGfOF0LDZ846Ogz5RKJrnYHs9b
	 Blp6ssRCqsa1g==
From: netdev-bot+sinfo@kernel.org
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 ripatel@wii.dev, xiaolinkui@kylinos.cn, xiaolinkui@126.com,
 tomasz.lichwala@linux.intel.com, runyu.xiao@seu.edu.cn
Subject: Re: [PATCH net 0/4][pull request] Intel Wired LAN Driver Updates
 2026-11-20 (ixgbe, ixgbevf, fm10k)
Date: Fri, 20 Nov 2026 22:03:10 +0000
Message-ID: <179521219064.3294.15508125568773243695@kernel.org>
In-Reply-To: <20261120220022.3133664-1-anthony.l.nguyen@intel.com>
References: <20261120220022.3133664-1-anthony.l.nguyen@intel.com>
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

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
