Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968541;
	b=ekH/wpndVZTyWcmFZzcRSsZ6lTVE3GIgf1HRP+7pu5fWezKeI+lu6na/HqrRapMhD3ik
	 NfSIbAempulEad8KdUJWGqmAecxBt5nimGt3CTdKm/H2yP9gJtHM+wKk9pWgwglJ2QgrR
	 3OKvoijxncVxvl1x+pZlgstshQ/HQ4t45v3TdfnS+Bn/6mgWpCzkAAbrqKmZ2D0Y/7AeF
	 xjAHUAXlztnhxBC/SMhXQk+4Z5uZx7wiiOgxPkvcS5YqR/Jz3suG2wLFPmO40HtZ1rhh0
	 gGVvY2ioi3zC3nHXFlS55PzHIAV6okWvqCgevI1EfOCavpBp2VkKugE8G18loFDOLLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968541;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pFwx5MzZBh7/mCdDHN57k+dz7t4ygjNac57ppE+/kEM=;
	b=ZrNCQilh8em+48XWuYY1mBNENRYfBdU28/DYNx1ZZ+DrOiGppcqIfFMdnemHgFsh5rLh
	 9GacWuLztKSoBOZ2XltFKKpfzKuZfrZtTGTpApf2ceQMzpK+h/P0hQTVlnhbwTBMlUCZw
	 s6YNY0785I11jWWsWztUT7cP0YgdnpR/vXnmGYZ1s22QBWR6Ab2J63A2t96oZbfUvIseS
	 zy2H/+c9lBkIKQl1uqr4R44GWkHaSh1pVU6n3MtCT2VT8CYZWrETzuUxb/dwGmLXNmZ97
	 29NhqRk0buuooYnALlnFx7h8urGf+WKw0rlHla4mcHDJ3Sv88Z1bNxj6rimncWTKB0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timdoug.com;
	spf=pass smtp.mailfrom=timdoug.com;
	dkim=pass header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=dZ0hFNGG;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=esypr6nQ;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB60606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB60606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=timdoug.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timdoug.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=dZ0hFNGG;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=esypr6nQ
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A9D991400018
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:22:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 17 Nov 2026 21:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timdoug.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1794968539; x=1795054939; bh=pFwx5MzZBh7/mCdDHN57k
	+dz7t4ygjNac57ppE+/kEM=; b=dZ0hFNGGOQuL9EuERVg75uYbslsFjQNRlwJh5
	gx9I9Ld1JlpOMEHLnrl4lnhXTT6OzG5/cc7rgyrMk9yW4O5zvgaTrEDL4jqu0fWA
	rY89ep05kQOzYfmuvKJjXsimyBDdniAvnoUWnsXhRyWRahR/05Z4gr4kOOhh2viS
	07qQ9JW9wKz+dN+7yxO1wlehC9PAh38oRQfusRFNO+HblmWckKYONgTReSZkhanU
	bN+mnJdrtONF4V6dsd/iSKhtapjMU+rGX+PQUINcnS8dq87mdvXFjzAQ1hcpgm6S
	SbPQG0mEFF9ryzWy/MkGdwTqtgs0NRB6PGI7s9yBqRMQKzpCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794968539; x=1795054939; bh=pFwx5MzZBh7/mCdDHN57k+dz7t4ygjNac57
	ppE+/kEM=; b=esypr6nQNlDHeK3M4AJ3CvYDXXkRoLyL4uhLA7WnqBbboo0SI56
	cIuKAtSmELGhagGuEbPuGTs6PmPRIxCxOzFXv06rAgPpSCJdzkrfNTslH5q3p57i
	DPklj730inqrVnviX+Dto0ak9t5Czvuc+/lPsNCk9boFO38+coy9W/UFvFjALZ6n
	EgJykJDWFKIzWUie/4JBYGmSIJ0L615PYoHGgxmlWMSH/UtDgF037hVLFTEQu56N
	lpvdnpq01MByeWQkd0UVcmfPXAykUvKoB5TFHmHWG1rdfWf223vGpZF7MP/CkRQv
	W3wEF3hpzBUBH6HCwxnXVy9+m7E6PHk5zIQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=timdoug.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794968539; d=timdoug.com;
	mf=PG1lQHRpbWRvdWcuY29tPg==;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:Ukhm5DEFVAYVlddOynqXM4N4L3ffKxbdU0C5iapw0/QxLWy
	34msbUh6se+hIqjWixPZOsWfIwHLzb0D1fWlwWPrRrQ96ot0AyLnHeN8nPGjDBA+
	kM06Mcvcql+gJB138WbR2jP+GgVk5ieIkX8VWvMIeH0emu3cSXKDnh/Bv2MFf4ZM
	b2KVj1HdKa53JqVa4SGI/mQbhMhB7DOWqz7iNqFx0tfbec+Jp6g0fttGKQX3xk4K
	G59upX2G58/7vO56jtGAkWSIJVk0WKaD5QQSGaf5hG4cKI8KlI/+3L8WJQ4LeR6g
	olmN58gp6vKXz3iem/FTqmjUl2Xp5HizVuIUlcQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:/2cQkehU3ICBNGB/g8c4Pskx+k0EEanSiu94EgSd2j4=:AQ1MjiFVKeBh4nsENdKWhzJxr3XPsMVtsNU9PWKKN7A=;
X-ME-Sender: <xms:2wv9amIpBlgMBqSV-CgDzvNzgnHSozLpxiVYlSbqizIQBWRUzu6UGQ>
    <xme:2wv9au0Y1bQrSxHZHRBqrhABTpFSuZWnD2za9pkIOd_IcfIRsb4H82YgWz_tJ2eps
    O9_pJBKj-aCN5s0_w0Qc4CCEG7eV74byK4TSCGbnSQq2LrIoprJ>
X-ME-Received: <xmr:2wv9ak5fUTuo-FacJqgQOzDhZM3tm4PtJybKl_apq3QuepHksvO_EYPz5qkO>
X-ME-Proxy-Cause: dmFkZTGGsdHicltRob6KsUhd2/+6WTPf9V5kwOLn75mELVxwAHgf8Vkh+Qt/sNRRhi8+VV
    FQT850HSY3EPpYVZa3ho3rGyini0N4sgBA+tnONtrP04oE6pNud5q/Gx0vEUB164jyT6x8
    SqrflyPSr7nSi0Sdq+NCHev1/tjmLjiOdsFKDcSvbuhIBPzlcRxYa5CpwWRSiV6MfVnvQO
    TpGIDPckCABqbPzcGTkkTPGIu/G14/cfjduZQ1cUX8m5Of5P6uRmd6mmEnWCc5KkoMG6EO
    PFYIyCp/JV1/W5LoXsPZFBbdzj7sYbUOmTG9I/dZ0Km8oltyy28g/XbtVG8KJYeMlZE2bM
    aB0XI0CCzrR7pR2Xfh3Wq4U7Mq3YD38s8Ga0n58SjKuhlAspJ9kkp8GWEAyAIfbIyn3Mp3
    TXM6MqHXEZuMucT1ExNbaIeP/0ic7K8p95aLv8+6GJ+5g30hC8DIBAc4/MnsiHTNWPgXgJ
    ShNFKZNL3SaqAYuq3Nxd1SvId+E+71tlkmbLT0wLYkF5HD2slUVtcwWgN4D1UJSYRloD4f
    /awHo8qZx6j7cuyJBWfXkykH0DUz02B4ZelxNgRRZAkkjKDt47cmZM64o8SbmWbu40xSpt
    94b/i5Lx1HTHqYTsD8OfoeaCD2eojdml/WdlweuZ328HHRcKlsbt3NSUhPMw
X-ME-Proxy: <xmx:2wv9av8Hey9laHXDT-PN8bNIANf6lyH2-YZH0NLdkacJ992rxu_5qA>
    <xmx:2wv9ajXdf7WQ9NfKUPHGYMXEWv4rk5zYKgJPsBStQ7JXsAHKFE2C7Q>
    <xmx:2wv9aqrIc5nI61wb8YZlgMsoTuB57CHWbrynhUpYeU7Zqyu-FnD4Tw>
    <xmx:2wv9alnq2VjC4wnYeoFv4nCuFiGSGDYspksX4aQpSp63RSSeEF0XxQ>
    <xmx:2wv9atOBkHFOfKfuK_4MC_ewcBNJHQJN9Vt19mgYSytY_1i6zypy3XpV>
Feedback-ID: i12bc4175:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 21:22:19 -0500 (EST)
From: Tim Douglas <me@timdoug.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: lib8390: avoid truncating the expected receive page
Date: Tue, 17 Nov 2026 21:22:17 -0500
Message-ID: <20261118022217.84500-1-me@timdoug.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a receive ring ending at page 0xff, the expected next page can
exceed 0xff before the ring size is subtracted. The value is
truncated when stored in an unsigned char, so a valid frame that
wraps around the ring can be rejected and queued frames dropped.
Store the intermediate value in an int.

This was observed with the 64 KiB receive ring enabled on a
Farallon EtherMac LC-TP. With the fix, three 16 MiB downloads on a
Performa 6200CD using a kernel with local platform support completed
without receive errors. The pcnet_cs driver also uses a receive ring
ending at page 0xff for Socket EA cards with the large buffer enabled.

AI assistance was used to investigate the receive errors and draft
the fix.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Tim Douglas <me@timdoug.com>
---
 drivers/net/ethernet/8390/lib8390.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/8390/lib8390.c b/drivers/net/ethernet/8390/lib8390.c
index 84aeb8054..93c514602 100644
--- a/drivers/net/ethernet/8390/lib8390.c
+++ b/drivers/net/ethernet/8390/lib8390.c
@@ -660,7 +660,8 @@ static void ei_receive(struct net_device *dev)
 {
 	unsigned long e8390_base = dev->base_addr;
 	struct ei_device *ei_local = netdev_priv(dev);
-	unsigned char rxing_page, this_frame, next_frame;
+	unsigned char rxing_page, this_frame;
+	int next_frame;
 	unsigned short current_offset;
 	int rx_pkt_count = 0;
 	struct e8390_pkt_hdr rx_frame;

base-commit: 76115f0ab948a6aeb66a0b9bd4e074ed52cd6946
-- 
2.39.5

