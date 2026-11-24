Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509844;
	b=oO/3B5c/lhtUvnW8r4xMaJByLeU0raHKcRbLNC45mX84uThL/sievTRILUYOdjlopxUV
	 YymtuwC1fbwqkJA1dbEpKszArp9uiI5OdUmTN8IzCQpmeHVd8+M+14X8azKI2yCefTPnP
	 5KX/B7zQknVeLeqVhbWP6cowTSIZ0shciGcDMR0O19SSgBd4itIwLxDkkD7fHox8+Rj1G
	 QzaILv8TOv2lC7nqvpO6/BMeIFIomPvLzzeuWWe2bEnTKMT1OkzEPS9HgOTEkYABXPav6
	 ckpHxZH4VCFQtStcxQBtaTMefZj5bouxs1NDtHqIaNwwQiWraZYQ9hWbhILzBH7ERTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509844;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=w9Kr8rH22TFgRbfHmb/G0vQSCP5YtFDMW42H4QBiXpunVLJkPXKuDBHuJ9+Lpcce3BF0
	 jYHQmGUAN3ZRCnAvbJT9mXmXwFbNViXGrZUlxlP7vpK0XkRoNBgigVOM66I2DSG8lQh+r
	 UBwfHtPn/Tx34TZcDhlrrI+xEQwAHUWgFMV6C1p4OifUoSXci1L/wOKqbLtAKpirwZ1bD
	 etkVYuzSWkZBJUY3wS+4EiSDDym0f8o3qbiz5Dng8Wyxl9ezj6bfh8BZOFIBMjcs/xQTa
	 2ajePegeqaNbKWNhEbKbLhSXbA55pf75YSWf8jn3nm1E/1lRIMuugu6JwbKTMr/IjEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RfFQX5pY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE5606A322;
	Tue, 24 Nov 2026 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RfFQX5pY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A3D1F000E1;
	Tue, 24 Nov 2026 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509844;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RfFQX5pYywzWwIExCsg/N1VM5J6whAGFsS4b7TEkiIEaSGLmFGbrgbt8m0KS5iTqW
	 YvMa9Kddg6Wxv4NsPwnGy/pTBNR0F41ZSvW/AaI5IvF+ofXFW5Y/lOyKuUgwe8t6bP
	 hl88zXnQaGtO/spIPIkwWGxjcpNvxL/81T0De3ePMzfe1chqSLW8zx+PksLhrBTjwT
	 9pT+dQki0K6QUTO99gNX4BU2ETjFBA2/ruTCEm+3hOM0HUB8hpP1L+voSM3pdyaru5
	 u8lOKAmBhjZ4XBtNMZQY9dm2X2h2YjGxNXvr9HfW4s0tyFpxLvsA+OwxMiiiqDxWMS
	 tGWJ1iLCofe2A==
From: netdev-bot+sinfo@kernel.org
To: Linkui Xiao <xiaolinkui@126.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rosen Penev <rosenp@gmail.com>,
 Christian Lamparter <chunkeey@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Kees Cook <kees+treewide@kernel.org>,
 Daniel Machon <daniel.machon@microchip.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>
Subject: 
 Re: [PATCH net v3] net: ibm: emac: attach and start the fixed-link PHY
Date: Tue, 24 Nov 2026 08:44:02 +0000
Message-ID: <179550984290.3294.12688015521683223828@kernel.org>
In-Reply-To: <20261124083941.2480237-1-xiaolinkui@126.com>
References: <20261124083941.2480237-1-xiaolinkui@126.com>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
