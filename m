Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500102;
	b=uMpssyCQ4qzOA4mWK7Njs9ffZppnmId+AlYM29el+jVWEmCGzO8vt4SX5U3aHViPmdHQ
	 LgXQ2lo06iUGXuWPoso+E2UsSYMqoCLPk6QK5e9zoSOryjOauvDgPxOBOoyonmAIzXI+J
	 LYl2Cmox5cZuFVtjSM4jgyH1O6WbsJHsYwW506BoBS9qPlo810/fFw+Dp4iblcJPSjN/i
	 NVQ3a6lRKZRI0x9RUaMJ0G1srpNXxqoqX7hAnTciXx/2ba93JFdphwz3PnvZS/dPP883D
	 i4Ytro+/e2Ox1W9KPvIES2fiRQ84yBOOk7vjLJDEkIRA0JwbhTUdPJkGRwBA7/qDPcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YLWBcnjpHzaKWxBReMI58+o9to+w6VCplIwRTps6okE=;
	b=mc9w4nrHvWFVtuCbr4wttWlhT5GAJTA0Tc5OrzfzdKLECa5tCJ8pTJ8paGm9AL0bFK/+
	 RW5Gxlx2cosMISgNzUCUeLnBDGeuhGxo21fiJUv2/fUaXH+9xvzo3tO/nm5rtiR/IVUy/
	 201thX1xYQX9E+Yp9pxehsvIRcAuwLxbRYZ7uGchvWZ/cfnNIVvduiT33YHR7wpMG+ECm
	 Z7biMlQRisSUDz0XzNhOqLnWemZJipoJYfp7FdTjiDtK6ql271wS2WWRdnoxVCKm6N5Pf
	 q20sMmfC3jHlaKjB++o6XoOddOw9A4Trv1d7m8lNjofGTZl81k1nH5iJCiY44s98KGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdobrAK0;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB7606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FB7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdobrAK0
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso8914003eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795500101; x=1796104901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YLWBcnjpHzaKWxBReMI58+o9to+w6VCplIwRTps6okE=;
        b=pdobrAK0hUrL3+ecyic0D/QiuOsi/ozJVmh/ToQhxe9HaIGxw1YYO+fc/0+peCaS47
         4hSHcdlAZXP5b03DQEnqltRsl1I/eq7uVdLs5moM2t/x1fBxDYnGM719vJ4OFZfxEkpw
         SgY9LDDGwi1qfz4JuZfnxwvkpG6LGZFZBI4ZxtXWXtcy7zne4piXiE+LmtaEPpj3p5Yq
         99pjXeg3SWcYmmB91cvLUdZ+7K/ufSdrARpOXaM00FsJlhW5rTUANGBwf6sQMarxVlgi
         xUW5qJA3DX3LIY8oA8sFwRGp6J38AOe++pix4m4DHzKoCnO933Ux4dqFvT6mRPKmdpCI
         ac+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500101; x=1796104901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLWBcnjpHzaKWxBReMI58+o9to+w6VCplIwRTps6okE=;
        b=jYUCRUx2+kLfyRzCSclkrAw4Yhcr9/M0zVodkw1jPSSc9oTIjMI7gaosqLe4Foec2/
         djOAHjDIzQrgUiUecGAdXqxcF6MGhBS6gfwGosvYnRtdghCcq76Tm1z+Gpz4tT/JkmeS
         Qub6NJggiL3i/jNRSxIlGg19UDbX9+9541Y7UlZYkQPMylvQgzDIS9xl/oLKuGNpfzgs
         AMmRys8f0qyJV6Kwhg04B3NUw9g9/y/LEAgc8yyQNZrrdyxoHL6gfi2c3UvpG2vrWyuT
         jfvg3KquvzpZ0UdSt9w/Gby6nYIkFvLYWYklY2w9n3gWG373cmP0sVJT/f5zeA61Bg48
         mTRA==
X-Gm-Message-State: APuU4Z+7IXqC5U9ThgYFBuT5FtgXSroasAm7Uzi9QLzIxZh9x9Gay9df
	tRBiBV+tekIUxz9gyi4fFRUmb76QZiJs9u+TEyT0H/uUvwPIHxRrJ0tSfN6tiQ==
X-Gm-Gg: AZFdTZfQbKGg5III1ZkX2M5Shw9CCZH84z/STgKZQHbbp2uYCrH7HaGB8aZBxC1Bl03
	BV+XbVAJc7/K6g9i1QK7VgC85xJrjUUvN1e1tox+ezLjcy4diZW6Ev8vGBHv8rteCDrzCdZ+3na
	PdWIvG/SxeY2uq+axfdc+Hk+De69n6knMgpsnDPUxxcuu4NlFMuCW6gt82bWlRykTaaffP2ULMi
	Lh4hYExM0EjFLBYemmK0Pta7yvXXISjU2rO368t8UZsXjYalSISs76VVU4YjjLIBemdNhygGoe5
	D3Ei3ae86/T24LDRk67BlIALZYjH4O2GbghjQr4d/CWWVQL5HkVpBm9zJ4/f+1vCVWf4ra515Vl
	KbMkNPt0WA8iuIMP4Vcvk3P8ZlFqWqofy4UahTQLuU0fMgnbImltDwsQ5BTVmXyviUaZXQC/p/2
	c8ouvAJq/j2BZ3xKWkJsICecqzG42qPl7VhbUtuGn0eSaVWVHSy6AkS2UPoRW23I+UoPZEksWP3
	DcZR67gB3ffkKCrxQ1gt96nNo6azSHRfo/MKYDVmqBXcc6lRW0JoXbGau6Qytb53koyVMxcWq+P
	jtN+qGpDj0nXoNGBVzadCkhVYcdEtwNuyrQdrhRxMrS3pka8+IsgmZohgLAAgxv8X3EUgjYXCKP
	hcJvTIMIAwqcMZjMv/Vf5gF/wZloFWiJBv70YLj15K2RQ
X-Received: by 2002:a05:693c:62c3:b0:386:a9f4:2d49 with SMTP id 5a478bee46e88-386a9f42e68mr6229535eec.36.1795500100864;
        Mon, 23 Nov 2026 22:01:40 -0800 (PST)
Received: from l ([2603:8002:ea00:6800:e2af:cae4:df96:350])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm44774006eec.14.2026.11.23.22.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:01:40 -0800 (PST)
From: Dave Seddon <dave.seddon.ca@gmail.com>
To: netdev@vger.kernel.org
Cc: Dave Seddon <dave.seddon.ca@gmail.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	David Ahern <dsahern@kernel.org>
Subject: [PATCH iproute2] ip xfrm: copy only the mark payload in deleteall
Date: Mon, 23 Nov 2026 22:01:39 -0800
Message-ID: <20261124060139.3393511-1-dave.seddon.ca@gmail.com>
X-Mailer: git-send-email 2.56.0
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

deleteall copies XFRMA_MARK with rta_len, which includes the attribute
header, so each delete request carries four extra bytes. Use
RTA_PAYLOAD().

Fixes: 0c7d651b38d6 ("xfrm_{state, policy}: Allow to deleteall polices/states with marks")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
---
 ip/xfrm_policy.c | 2 +-
 ip/xfrm_state.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ip/xfrm_policy.c b/ip/xfrm_policy.c
index 5261a292..1a41f2a9 100644
--- a/ip/xfrm_policy.c
+++ b/ip/xfrm_policy.c
@@ -783,7 +783,7 @@ static int xfrm_policy_keep(struct nlmsghdr *n, void *arg)
 
 	if (tb[XFRMA_MARK]) {
 		int r = addattr_l(new_n, xb->size, XFRMA_MARK,
-				(void *)RTA_DATA(tb[XFRMA_MARK]), tb[XFRMA_MARK]->rta_len);
+				(void *)RTA_DATA(tb[XFRMA_MARK]), RTA_PAYLOAD(tb[XFRMA_MARK]));
 		if (r < 0) {
 			fprintf(stderr, "%s: XFRMA_MARK failed\n", __func__);
 			exit(1);
diff --git a/ip/xfrm_state.c b/ip/xfrm_state.c
index dcd08d59..7e365b19 100644
--- a/ip/xfrm_state.c
+++ b/ip/xfrm_state.c
@@ -1203,7 +1203,7 @@ static int xfrm_state_keep(struct nlmsghdr *n, void *arg)
 
 	if (tb[XFRMA_MARK]) {
 		int r = addattr_l(new_n, xb->size, XFRMA_MARK,
-				(void *)RTA_DATA(tb[XFRMA_MARK]), tb[XFRMA_MARK]->rta_len);
+				(void *)RTA_DATA(tb[XFRMA_MARK]), RTA_PAYLOAD(tb[XFRMA_MARK]));
 		if (r < 0) {
 			fprintf(stderr, "%s: XFRMA_MARK failed\n", __func__);
 			exit(1);
-- 
2.56.0

