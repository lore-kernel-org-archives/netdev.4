Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.71.1.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614250;
	b=xPyKejkzfQvfXkeUW7hNyyzeW/PF3yRebZcWSvv/QyngyAo9kncy5d/8CezJDLoAClHW
	 RKodMG6ytbpISOrSn148ayi4LDYF44nebxAH99yBkU6KHGQnj02n8A33AFcOth8TKx45b
	 urHtooFZ9iUmODinai2kseOAbokHBdZqEvEeVLrL9cznLGVhY55fFNSFDhA0fJtilXoFI
	 r0sQ+JxkjGq5ciD8nfxaClj/5eXIqSfJ8ilb7jKVyex8GhF6YiFeXIb9xVs2NSt3WNG89
	 tApl/Bxv4DnSGRmIWnjlKioVUtvkGXaxv00UpEuXTlqkfCUmED1ebmck98wd/U3B2Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614250;
	h=DMARC-Filter:Received:X-Barracuda-Envelope-From:
	 X-Barracuda-Effective-Source-IP:X-Barracuda-Apparent-Source-IP:
	 Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 X-ASG-Orig-Subj:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Barracuda-Connect:
	 X-Barracuda-Start-Time:X-Barracuda-Encrypted:X-Barracuda-URL:
	 X-Virus-Scanned:X-Barracuda-Scan-Msg-Size:X-ASG-Debug-ID:
	 X-Barracuda-Spam-Score:X-Barracuda-Spam-Status:
	 X-Barracuda-Spam-Report;
	bh=qj3qlAEWyY9IBJU457s/Ux3zGYUrpSNStMSYuv4tkRo=;
	b=B+R9UxqimgSEj5JOkx6IP5fIQqES61MzRqPr/mzTruE9Q/giBTTxuRtLfWYyMWup8Z29
	 UolXkS0wVY47LjU7vpbHXNaNalaLMy+xlC+gOL6Cf1O4NMRJ5NDUyPQtcSdJKCbo2vM6j
	 ms3/BTK1w3X3huj57Cr3g99vcjrlGDxgOHlnhTcHNu5BEmu94zSiyZhJS1lB2Wbtv3Mar
	 Bt6lTMsuZzwmHLbCqkLTflFVjG0iJ5mgqk4r9PBX6UBwAt/0Qf9g3f0qm3cUZ2HDS5yL3
	 ZKiV7O/d5cWD0bK2hMsXYvfR2N4twjHInN/KBDGM9cajYZhg+IjzKxiRmo0nHkBhTnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vandijck-laurijssen.be;
	spf=pass smtp.mailfrom=vandijck-laurijssen.be;
	dkim=pass header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be header.a=rsa-sha256 header.s=default header.b=UheX4ecq;
	arc=none smtp.remote-ip=212.71.1.222
Received: from relay-b02.edpnet.be (relay-b02.edpnet.be [212.71.1.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF761606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF761606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vandijck-laurijssen.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vandijck-laurijssen.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be header.a=rsa-sha256 header.s=default header.b=UheX4ecq
Received: from srv21.vandijck-laurijssen.be ([213.219.153.140]) by relay-b02.edpnet.be with ESMTP id AgiBz5o9SnwFiOA8 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO); Wed, 25 Nov 2026 14:44:00 +0100 (CET)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: UNKNOWN[213.219.153.140]
X-Barracuda-Apparent-Source-IP: 213.219.153.140
Received: from fwg.vandijck-laurijssen.be (fwg.vandijck-laurijssen.be [IPv6:fd01::dab3:2fff:febd:d001])
	by srv21.vandijck-laurijssen.be (Postfix) with ESMTPSA id 33083B389CD;
	Wed, 25 Nov 2026 14:44:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=vandijck-laurijssen.be; s=default; t=1795614240;
	bh=qj3qlAEWyY9IBJU457s/Ux3zGYUrpSNStMSYuv4tkRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UheX4ecq0duA2RB5l0GOqgtOxGqtKBuhKfa5fgjPUizdB8ti3XxcOVU4oEpG/vrG5
	 +g6HoCJGgUoTBXQleKEHvNu5Khy0g2WRa16ouTaCQrZbOlHFWqN+939028+o1cmaQh
	 OpLyOb1HrFEF2TeHWbpmjfkuFo6yEhvxxWprVfsJ7ub+kKbbp+jvtx9C29aIvJCQsx
	 KFYpE2AZhgohOwzRDHzCDZLaEHtdXG5lcIkYi2TRTMGhgScW3HBqfYjsDulI/jMINt
	 ICuvAH5GjnxaRkePLOB6wVOLXJn7VgX43BKb0c0ZGCrZdcSYYpxWuhslYL6rQoIPsn
	 R9L5Ml5jmpbKA==
Date: Wed, 25 Nov 2026 14:43:58 +0100
From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	linux-can@vger.kernel.org, kernel@pengutronix.de,
	Oliver Hartkopp <socketcan@hartkopp.net>
Subject: Re: [PATCH net-next 10/12] can: remove Softing CANcard driver
Message-ID: <awbmHl75TSW4fc1K@fwg.vandijck-laurijssen.be>
X-ASG-Orig-Subj: Re: [PATCH net-next 10/12] can: remove Softing CANcard driver
Mail-Followup-To: Marc Kleine-Budde <mkl@pengutronix.de>,
	netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	linux-can@vger.kernel.org, kernel@pengutronix.de,
	Oliver Hartkopp <socketcan@hartkopp.net>
References: <20261118092955.1283165-1-mkl@pengutronix.de>
 <20261118092955.1283165-11-mkl@pengutronix.de>
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
In-Reply-To: <20261118092955.1283165-11-mkl@pengutronix.de>
X-Barracuda-Connect: UNKNOWN[213.219.153.140]
X-Barracuda-Start-Time: 1795614240
X-Barracuda-Encrypted: TLS_AES_256_GCM_SHA384
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 60
X-ASG-Debug-ID: 1795614240-214fdf6fb6350990001-BZBGGp
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=10.0 QUARANTINE_LEVEL=10.0 KILL_LEVEL=7.0 test= 
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.125474
	Rule breakdown below
	  pts rule name              description
	 ---- ---------------------- --------------------------------------------------
	

Acked-By: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
