Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614364;
	b=aQBvc2u5iL++9QrlEscZiRtfkXQxp3YJfYWL+f/wVJGDSQpIQOKHkd9Uv/mL1HDRk4Rp
	 CtAJKLQHHf9djsxxGjaUCb7YkV/66SjrOBnwjE3sleJyiVnpGiBc75/ay+GqxgXY1pFuM
	 zGnSsm6GpPDrE7gKxeqiOX9e1tZWOFvHESF8qmtavj7GczmsV5XepeNS+apnV5A4hIYRB
	 RYh8Q4WnK+0b4fRhc6JSy5D0lEhmgsJeGmJiiRWndctbpEfDHxCrjDR4VjO6wtedWJCrd
	 ztkb3Zh0pgKmJT/RUQ59bQW/oSdiK3UyJVvih9ukmx3sURF1pwDP3ag0xxaLP6FuNQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614364;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=b4sIt3pOcP2WjOnFWhiK5S5uXGqebYV48QQpOwEAHGs=;
	b=aDlDM5enfvkriXjP+J/UFBJmggxW6jzhglqIFlHHkeVnCaAS1WzleuuP00CwC2C7IDL3
	 DecviGNQcx6dLnQ+KwxSgpgKOp2ESvgVoMCIdNGyKXWDVz3hH3SrsudbmkMYgyiyIgZrb
	 amMEtExMC+2P2RpIgD1vORTL3XJzbJZNUR3l4FKgJ5FWaW6Dk0oqKZGVB58hlTfR3+1d5
	 KYBgIXhI7rP9X490MldlR6fULHCkarbzB8etqdZp8b97VI5Q8CcxCllALUQFuiGGmm9ZD
	 BySq/bJ1wTbm8q9PwsnAbncD8mnN1/MuujM8gKkjl5ptTxLboObm4c+6JMifyyivpbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eX5o3CZI;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CAB606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CAB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eX5o3CZI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0CA231A17EE
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:46:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0E4460480;
	Wed, 25 Nov 2026 13:46:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F228F11E6962E;
	Wed, 25 Nov 2026 14:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795614356; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=b4sIt3pOcP2WjOnFWhiK5S5uXGqebYV48QQpOwEAHGs=;
	b=eX5o3CZIhdaoEG7SBIuXiyNIp2/FOn04W3zIdJhd0/KmZJOAXp7Dn/k7TSNEBsrx1k/Q1p
	YEHmYAW+rvhJtqwGYibsjxDeIE9xPscX9SlzN8R8aZnrsmnLABckATdHvr1bJ963HoauEw
	/77p26hrno2soLoOr83TQj8FUxIPIq6TOjSmJ+OhDeqxcOvJL6JbchWR9AsdGtbRaTSWWC
	D4ssq0LOHDORXvnOIkhkCcDp5cRQ0r+bNSyzx6g+gmz+5cqkIYv9JfOCXLz2qc6QIQ7v+4
	/fMRTvXsE2zO7hiRkHvGfwtkacwYC14USs6v2V4a2v/fJue0eIT/RMenJTzjKw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Keon-Hyeong <leegun25@proton.me>
Cc: alex.aring@gmail.com,  stefan@datenfreihafen.org,
  linux-wpan@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] mac802154: look up children by extended address
In-Reply-To: <20261124085905.710751-2-leegun25@proton.me> (Lee Keon-Hyeong's
	message of "Tue, 24 Nov 2026 08:59:21 +0000")
References: <20261124085905.710751-1-leegun25@proton.me>
	<20261124085905.710751-2-leegun25@proton.me>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 25 Nov 2026 14:45:54 +0100
Message-ID: <877bi1yqgd.fsf@bootlin.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 24/11/2026 at 08:59:21 GMT, Lee Keon-Hyeong <leegun25@proton.me> wrote:

> The source address of an ASSOC REQ is always an extended address, but
> mac802154_process_association_req() builds the lookup key with the
> address mode chosen for the new child.  With alloc_addr=1 the new child
> has short-address mode, and cfg802154_pan_device_is_matching() rejects
> short-mode queries, so the lookup never matches.  Every retransmission
> is then appended as a new child, consuming an association slot and a
> short address.
>
> Look up the existing child by its extended address.
>
> With max_associations=2, two association requests from the same peer
> exhaust all available slots and prevent another peer from associating.
>
> I found this during an LLM-assisted code review and reproduced it with
> mac802154_hwsim.
>
> In a separate mac802154_hwsim test, 64 requests from the same peer
> left 64 child entries on the unpatched kernel.  With both patches
> applied, the same test left one entry.  Kernel selftests were not run.
>
> Fixes: 601f160b61b2 ("mac802154: Handle association requests from peers")
> Signed-off-by: Lee Keon-Hyeong <leegun25@proton.me>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
