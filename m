Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593120;
	b=T8+Rz6UCDu+K2oLyieCeDPXMp0P37MvhXCPYBSQchvrHjqp13PiEzHhW1B0kbfrZMUZB
	 kDc52NSNxrlcZT3pcvXHnbsfld/CeEXAEDslA4mGvO5LW4TPCPmeEwQf6yHUVd0lykEUX
	 Blvql+pIRUYbsQSACNlyBwJQgQNTKLWC+WoaMnaOvtjMyfk8VXARlpRIybJQDL/ZoaghL
	 XLm7WKWKwhXjGdBT6FDdGOe/TQGj7ODGuF3m9BOjL19jKDqJFiQPuho353QRB5KQyD+Gy
	 +h1+W1RLjiblhvxegpxJqmfW6boHjAbqC0VNL3Z0MDOUUwXQEisD0sApB5ZogE+irRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593120;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=7RE8Zp2YgJVdCh2kpJuYhJZ1G6gN7pY07aI/1JKeYg4=;
	b=v0rZwexulNiUJnZMaV6BvveOCYl07UzH0Owk0dEyc4z9fB3omx8/QhG5JWczZVyj6B3f
	 irgu025ZjiOCYQ55gdca9rZGvpfT8I6XAGfkIlZeTz+/JccttvAF6WpwpJiXff66zoQ2O
	 mO8Mitjs1/DJTCCL9FqFywaovB+cZXEuiTh/JjxQqWkCPA5zYO6Ix8PaIeMzv/Ag+CRmF
	 sVIna3EEbsjVzoTc6fJzXEueKkbf5vFIFbByrmwkLiMW9P2m55wgUwYQ+I8KBfRl7xZKR
	 IMr1MyWl/UJMjPwBxZ6r9mbqGSIOQtNFsUS0w/WWGhSMRhtEjWe4o3cKm9axlWErQvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nygTnLeI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zaYDHcsG;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51923606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51923606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nygTnLeI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zaYDHcsG
Date: Wed, 25 Nov 2026 08:51:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795593118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7RE8Zp2YgJVdCh2kpJuYhJZ1G6gN7pY07aI/1JKeYg4=;
	b=nygTnLeI/wUaXnDxgB6d6vXMIohTpgilWQnxUGduMptZkWDTQys6/aR3DtTr2iiZseMCiS
	2tsfz6yUulkuJcEV/0ypmpj29+rXQpzRRtgSkv3MV3R4sN2+m5bxWE5y49Nw9jOVY7ZmNc
	0MeaqRyXW1su7wVEz7I2wUaiX1meO/AU9LZDnF/ZIfp9ZafdN0ULkyYvx/fdY4K5sZgmT6
	Ad7Hydus8rj9X7Ga302kdWVoovMHa8SMTXb5Lnsxy0DspDkrGrvtYFU7dbgxyTVuwma5jG
	+tjQybJ2IR2C1v/btGO7C+aK3pnTDQLD/RVb8JKT0Vz/2N7XlyUidfknXTDaxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795593118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7RE8Zp2YgJVdCh2kpJuYhJZ1G6gN7pY07aI/1JKeYg4=;
	b=zaYDHcsGSnESsZECwygqKDc/K87Gp8UOVBCK4AVnXTn+QH7L5xu/mr4Ck9YGB9rEiD1dVi
	jei4QYvyQAY5QaAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, "(JC), Jayachandran" <j-rameshbabu@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Danish Anwar <danishanwar@ti.com>, Daolin Qiu <d-qiu@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Felix Maurer <fmaurer@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Neelima Muralidharan <neelima@ti.com>,
	Paolo Abeni <pabeni@redhat.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Pratheesh Gangadhar TK <pratheesh@ti.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net-next v11 0/8] hsr: Allow to send packets on specific
 port and pass the timestamp
Message-ID: <20261125075156.OYPKkHgM@linutronix.de>
References: <20261120-hsr_ptp-v11-0-264c88f4f1d0@linutronix.de>
 <CA+FuTSd5Wjp=kCEtgD=KvR3njFXm4zuMXAkp9T0GxdVfHoAsqg@mail.gmail.com>
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
In-Reply-To: <CA+FuTSd5Wjp=kCEtgD=KvR3njFXm4zuMXAkp9T0GxdVfHoAsqg@mail.gmail.com>

On 2026-11-24 20:55:40 [-0500], Willem de Bruijn wrote:
> Please add tools/include/uapi/linux/hsr_ptp.h to the HSR entry in
> MAINTAINERS and silence/fix the SC2154 shellcheck warnings in
> tools/testing/selftests/net/hsr/hsr_ptp.sh before posting v12.

Okay.

Sebastian
