Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160857;
	b=1Fv6WSY5KyRmYWS6YGYTgv8f5+LykmdEe8BNdk6efuth0plH/TSN32GYfT84sPIvzRJi
	 CalrKTB0Wl2CjReJPHPuMBHW0SMRNbebgnDTtS5XHZ95/S0PrVprGMNZuUyiCJX3BAZnm
	 koiBCO1mDB8FyE72q63EiiZDsUxWY0mgjd6uIPSlayuhj0XeM6UZ7WB76Tf5SL2dGTe/C
	 jq0j/C4giN/Hi4xj6OmaopTgSaNocwPDT5vjwGbVf2eOnaadk8iqL/YWnwS4+ETLuoxEQ
	 Qn23VNMZWT/xXkpUhA1Ue9U+GrgzOXdCJZaFR9qYAybAazfoo0SPOX5vYoODEf2aEnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160857;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FSohw3krshR42UDtXy9KYxKh4roxkFGgvXsdDyufsRE=;
	b=GBCH2CZZtQAzhfJFgaMo9FN8RPq57nEEsgKEP5dTC/AxQR4DMCTQx54pDOyboc/9IMJT
	 EOS9yRXTOyO28jutwq/zN1CE1I0KMjEKIy2j/rhV90E483IJg/9SDyhWuJFHP18LNSejK
	 sOK112Xm62SDfePt9YsgOgLUZXhWFL/yorCmU6+tzNqB5c5OAEGpEKT4qCdTzjJLYfMez
	 85/vOvuyaAwpC+gyKH70zpaAOjzpLMflChVtBiEHaIZVGusqkCHkCo0qGA7t+MqLuCjMZ
	 ghRCOni2J3XAIJs9ntcjsjIrOe+iHeSWnN+RC2KAYjJMAeO8+VfGiY/GUcNemHxMe2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="LnMVf17/";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YlswMoEN;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69572606A331
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69572606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LnMVf17/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YlswMoEN
Date: Fri, 20 Nov 2026 08:47:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795160855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSohw3krshR42UDtXy9KYxKh4roxkFGgvXsdDyufsRE=;
	b=LnMVf17/gTgcv4ndXvh8B3i416mjBRa6RX++tr1SFzpYz3kK0eWftERtMo79VmxW8mGee/
	F7+Ss5VQlS/8Vt6m36QOH1IeBT7wD8nq4WwagNAuuYSVyHxdrgvogKbmUq+g7s+GPeNi8K
	4gCEZt6QnKqsjQVrOfhPlp/bTKpMnLfGUl48PM8vw8EoMjD7lkdzYjgqoGY7YKQ/aY/Ik+
	CS72MPZ8Hqiq+8hYCp4PqQlHvyD/Adx/YKitDTWmc0lnjVdFVzxV9wZqvjSutWvSb5REeQ
	1wWnFdWoJz+jKQlz5IPfGPOK0rOmMsZlwoGZFH6eXKV3ZvvrHXLbPAPtw9wNXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795160855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSohw3krshR42UDtXy9KYxKh4roxkFGgvXsdDyufsRE=;
	b=YlswMoENxuuXmrSITvtAPWLdsd4uFXLxuVs9iEa03YIuU06iv6LInh+BN5wNnRWZz+80N9
	VNTwRIQgsshvtAAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: netdev@vger.kernel.org, "(JC), Jayachandran" <j-rameshbabu@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chintan Vankar <c-vankar@ti.com>, Danish Anwar <danishanwar@ti.com>,
	Daolin Qiu <d-qiu@ti.com>, "David S. Miller" <davem@davemloft.net>,
	Felix Maurer <fmaurer@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Neelima Muralidharan <neelima@ti.com>,
	Paolo Abeni <pabeni@redhat.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Pratheesh Gangadhar TK <pratheesh@ti.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net-next v10 0/8] hsr: Allow to send packets on specific
 port and pass the timestamp
Message-ID: <20261120074733.-xajH5p7@linutronix.de>
References: <20261104-hsr_ptp-v10-0-2c4a38ad973c@linutronix.de>
 <20261110134822.hjqynfqx6yauvnrv@DEN-DL-M70577>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110134822.hjqynfqx6yauvnrv@DEN-DL-M70577>

On 2026-11-10 14:48:22 [+0100], Daniel Machon wrote:
> Hi Sebastian,
Hi Daniel,

> Overall I think it looks good. I have a few comments on 3/8 and 5/8, only minor
> nits.

Thank you for the testing and review. Let me update the series.

> Thanks, Daniel

Sebastian
