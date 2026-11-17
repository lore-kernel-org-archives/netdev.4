Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910156;
	b=5e4MsiFJNsZbrPSWNvz9rhuK7SYTJYvybyqDWDgKvRlTMq4DD5YDAB4GP0fFE9fnZj1K
	 corBHxa1/0HmVowm2F5E2Gc5heQxN9dGfv4G/BQMABBkvwCZxRnopWDQducy4NJmtll08
	 8eiI1Bj+I7RQhpvKcp71AL6jiaRVgYvVTiaRIidJcApeTQIFYb6it9zMEq/88pk7jTz2F
	 zqC4ifY62llYICL1OocMZRAR2T4iIYTTdOUYOcdvq+NIRqoQURzK9dFl+Rbuhuo3wSZvi
	 +hnQQqi+ij+bT+5pH5tRki6QgLB27bYfFRWM1ba9AfMN2YPPVFgwZDiWh6qL1UXOQxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910156;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=efFy5qzGhOXzdl7ha+UrFef5foRsVEqpNLPg/lX46CI=;
	b=nNnKd9hHF/vjPlbC2UpsnGMbAwhjTRR/2TFzjcI4LV6chdWkF/VHzAN6RbTlUsF4w5RL
	 OXRm4Br97+uLrNmuw2BghU6TdN+uOvCoqvJDIAHwvq6jHBoACwlUwrftdsSjBH19gVTHt
	 f+KO7YSb0ZYq239xF2ejtgxpPqyhTVHAt3j9XgirRZtus28cg1E+WmXseaeeWwWwz5MAk
	 54VtusAY9bwHIoj8TEd9yuh22WyM6KmrqR/sNh75dTEvokdw6vOig5ZZU1y1TEq+IqknN
	 ZJKlXxz7D8qwJL0jsYPhrAoQlbP9iku15VxNWP5WBs4DGF2YE7tO67hX8QX7PneegLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fXAjJXt7;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354CE606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 354CE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fXAjJXt7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A3C3C4D3D7;
	Tue, 17 Nov 2026 10:09:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 481AF5FC81;
	Tue, 17 Nov 2026 10:09:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6857311BC0493;
	Tue, 17 Nov 2026 11:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794910153; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=efFy5qzGhOXzdl7ha+UrFef5foRsVEqpNLPg/lX46CI=;
	b=fXAjJXt7VgwfXDE9fcErcMBB17TbLufQtAQy/aQ9huR1Xx/tvA7Ehrim4GFW1ZfMKUmQUc
	dTJc468izwMk+bSY/cE1gXkXsiUe7zqBjItFxy5WpELyXhJBQLg4qqRleg9gk+7iYdznKa
	rrS9Qr//iVini/YPirHennlVFH+6nbDrJORNyv1hbkTUqHsmZA5p4fPcN+BCGUSTZyrDv+
	VBwZJTYUT9R6fwzia4Z/OS+pMQ8AT1cFWU1dirOkFkElSncV5rdEtL7lqQxFDTP6Etx1Yt
	OBg7MCMxQCY6Si2GeH5zunVH/Gl88WyhLaTpBqpfi0R6Nlc1nq2VhmNdtCEbig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roshan Kumar <roshaen09@gmail.com>
Cc: Yousef Alhouseen <alhouseenyousef@gmail.com>,  Alexander Aring
 <alex.aring@gmail.com>,  Stefan Schmidt <stefan@datenfreihafen.org>,
  linux-wpan@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH net] ieee802154: hwsim: free PIB after unregistering
 hardware
In-Reply-To: <CANphZRNSXy4tQ9jO7RT5g2X69T-CapR3-sSood1qJfYTRUE8ag@mail.gmail.com>
	(Roshan Kumar's message of "Fri, 6 Nov 2026 22:06:37 -0800")
References: <CANphZRNSXy4tQ9jO7RT5g2X69T-CapR3-sSood1qJfYTRUE8ag@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 11:09:11 +0100
Message-ID: <87wlqbn514.fsf@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Roshan,

On 06/11/2026 at 22:06:37 -08, Roshan Kumar <roshaen09@gmail.com> wrote:

> Hi Yousef,
>
> I independently reproduced and tested this issue on current wpan.git
> (2b4707a149a5). I also prepared the requested rcu_access_pointer()
> update. It passes checkpatch, targeted W=3D1 allmodconfig/allyesconfig
> builds, and 200 KASAN teardown rounds without sanitizer findings.
>
> Are you planning to post v2? If not, I can forward it while preserving
> your authorship and Signed-off-by, adding my Signed-off-by as the
> forwarding submitter.
>
> v1:
> https://lore.kernel.org/all/20260627235805.17310-1-alhouseenyousef@gmail.=
com/

No v2 sent by Yousef. It is the fourth time we receive similar patches,
can you quickly send a v2 like you offered?

Thanks!
Miqu=C3=A8l

