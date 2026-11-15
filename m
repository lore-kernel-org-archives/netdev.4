Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769331;
	b=J8roJBwnUnlq2B6qLokk8JcflJmNPTftjWuUwJvrqYLsP6+enwAZiP8IBLWJDr5dzHkt
	 tdNZmOmYdS3n1EXj91lJpZ/aB07Wm7a+BPyTg61JiM+6Z4XhQGM2KfhHHRWB+4KiKqESG
	 +hYMWkm1GAW+aBwzkpZo4To32CkocsVl0kCzygm1sjKQN3aiC3kSKDI0CGpCEbDO0DbRk
	 RmtkPCaPg79viBnV77xKUG/Sj9+IkVKO0okDDibKU6qy0XCz8MsN/eu7xfzn3eNqJ8Wli
	 hDMrk/04cNXGhdoVW6SsT88d5fQn2RO4mm87uz02LfX775qcDLxV/4j7TWc3W8wReDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769331;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=8TZkitnoVr4z68BOsDxOCMN843ycGH5d+EtWZ0X0TKQ=;
	b=fFyFluERCAHHNtggaXigg1R/8dNY4syVP7v6pbk7nJz3hAhEpCVrc9ige7NuWbhtAop3
	 wVRmvxeA7AMm0l4VRpslu8N0UUbe6eQGAv2oaQZcFFtVP/gb+yikhBN+VFUGxwZ2i929R
	 DhaJafMR3A1Fe7eIDKZ9klSBNmYQzTqVzaocglkP6Zrbxc6CeSwy63VmAy5iU7J/0ADMC
	 Q3rLiSqpK34nYqZDQ4PYOsDQCGea0YnA8+26tHgV8WAveGvOPeRTvlihy7xrfxu9JaSpN
	 o4geZKj0mBj3wns7MHtiXRi2vllPQX/yZeDPd5J3Kg9hEoiDmKoJILE7nLNqd9bGRBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Xui3/XLx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7DB606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xui3/XLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6126A1F000C4
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794769331;
	bh=8TZkitnoVr4z68BOsDxOCMN843ycGH5d+EtWZ0X0TKQ=;
	h=Date:From:To:Subject;
	b=Xui3/XLx9G6FDlrp7UU1q6wR3KKVGivhvljkiC18iu2TDOel47kVrnwFpRyZAHT8V
	 1ump8neFX4MpifSg3C7R2dhR7vMTVXQRBTzNP+C55QQdW4IbvRPsBR2w1sd+GX4fez
	 WCwDeMmzP4Z66aN9omfNV+Y53HSYKo2Wio51jh1oseeDFiLd5QlBBRsW//fW567wLY
	 voxmCIexiPHqX39Z1bzdcb0fqVYYNiPlKg67mFNE+UySvnZHiyjHQP3JVELrK3hS0a
	 8waXEY3LsIPl8ypi/bhoSc6iCa5SK6BIrJMmeWWxqgm0Xz4V/ORJyi35NVsvgO0ORq
	 7DJg4th3GBd0w==
Date: Sun, 15 Nov 2026 11:02:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: netdev@vger.kernel.org
Subject: [ANN] patchwork is not ingesting patches
Message-ID: <20261115110210.4a3f0177@kernel.org>
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

Hi!

FWIW looks like patchwork (and therefore all our CIs) stopped ingesting
patches on Friday night. The k.org admins have not responded to the
report, yet. Not much we can do, but do expect delays and (even more)
pain. After an outage like this it usually takes our CI systems until
next weekend to fully catch up.
