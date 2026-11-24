Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795499754;
	b=QktC9B9bSzCWCuLezkQfqtmgyogEbcPBfTt9RMl5fGcluRpxgkF9nRN6qehvWG/1r2eM
	 MoheaF3oP1zuvA5iswOE1D/2kyePinJ9VGuvM3F5Gtadyh3fXjLxeCp4S9YHexLCKSn3e
	 Cuh/Eczh0Ht0FZymBN0ZxzDCm0g8u8tPKYy2zMssTojKDrS+g8rvDihTQEWvGzuOLhU09
	 hwVYHGS+azz5OZkgeC/LVRoVTT5YSzosAjHC5s8mMN5mu0qQEe/zFHW8CHfYScwhbCZ05
	 WTDNJLfX1j3bc+cC+8wA42dXoRQoADqY5H/csrblEHldIwFQrHUCdJFFFUzbKFCTx+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795499754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WrjdSOVBF9/Ha0dzp2E8foMa3AoVKtdBUwrkGUaw8Xw=;
	b=yR6Ey2+5YXiYoS6juULTKIuJHsYui6yQUJmTqvN93S3aVhnvFs+J0+7uuLc92wsPNzDa
	 HPR1ArmmqKLP2DtTbjG8hxjCjlBSxNGyVtN1MCCqP1dotN8qcDfBaQDAKfNHld1sPPSf9
	 CJz6nU2Xe7cV1DEm4rB6bDtA0nhkIlDhvkxAxetvlJfUlfsjGRi0vQwOKxEOaFHBMriL6
	 8pOFs1llt6KLC1c3mpZVC4AIipSp1Bt9lvEEPNw2wVNlJEGGUo4elvzvK65Vou8KiJj8m
	 Dwg8uR4x5iY5Devweu0WwHVD1hBqMhwjD5IiEFHd01qyZXK3ApUNSAPf8TeNBqZNl9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHGPzlTE;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62837606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62837606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHGPzlTE
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso3647720c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795499753; x=1796104553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WrjdSOVBF9/Ha0dzp2E8foMa3AoVKtdBUwrkGUaw8Xw=;
        b=sHGPzlTEw/K+76LsLbmRp7tI8QZmt73pBsK74VDCv2hDk2s3KFrYXmxuN2R4mZtZ/T
         YM3NN7Dhl6ptQCB9MKkG7l4OStgz34eQYc6/1vUF8Y9z0rZ/PDVLRjoXHZeG71YtHFHE
         5Upu7Q+QrIx9Ys4thyEbVkUgWb4suPU+xDl+hyF8kSjS/XHjNR1bFqFV56MDYwXeZi3y
         YLWmRtGj06N3TQPQHYOsnD7C2g4UEEMXMKOMI5CXQkOgOt3JErIRuFYFpR6g1asr9r0V
         uOTkZfbYeY32vvCI0npIQIhvupeOvgV6E+Rq6pvx3BWJaER5Ye6/3yUMGk0kGqwuSQ+e
         PSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795499753; x=1796104553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrjdSOVBF9/Ha0dzp2E8foMa3AoVKtdBUwrkGUaw8Xw=;
        b=fv0HBTyZoGCn2OSxbEOz4+NYpyytSS/PveVgoPGH+dpIbyWm0kq2Wl/1SWyytAzv9q
         yeHq+DqSKwOikPHFPKww3p/hk7lE2wufb+qWRAG7KxNHS/N5fDZH188OuvidfwJ1VVn4
         cs8gfH+wTRc4iKBpbGzYGKyhS+RGvPARriSkbo7xoN3ibCwxp9O6PxNGJIBBGO8F0had
         LlgycQax0YgPO8vkb/Hg1Z5NJSe92KObiKF4Nwk+J4NdYoSb1c6V2NmZq6YexYI2jh47
         8u+KCPWPL/1gB12fUfzHyBqUY6l+29/CThghrASmFJTtFU+HQRFQlBEdOXI8b31Z5FnJ
         DSpQ==
X-Gm-Message-State: APuU4Z9UEMIzquPenLdWopijg9iCh8wv+IF/J0uXy5513xI1Voil5R2J
	GiRJun8qHMyT/Xcsz5Cb59OF94pTtagSUAMgqv00hwAb3hlQGTcBBTkD8xZPYg==
X-Gm-Gg: AZFdTZdxt39vpnSgl8OdMU390LgQnXyLaAKKBnJZvcy/tHfGMTUOFBtx0Wo+dzBJpLX
	v1aeIcoT8w72YquHCbmqNT3qr1aczLqPEpP9KAs2xJSbp5gJdaMGsF9NcVQo3t+RGdL6NKGd5Lk
	8pK8AkGBdXU3DBqCrg3hDE6qTWpbifSPt/87vulVNXvD7DLpE6j9AZtnVPHBxZmfMGa21eUs9U/
	SQ+fT6cNM4g9MGyK1/uIL6ZwSl/wAvR/LotBZyJl4kYFLRiEdVOISUYzQene6l3tK/A+fZhXMzB
	YTlzFmICG+eUrDGMU0Ww7+lw2C3OCp3m/dQASPMZzFQvOn3SxiB9ri2+m73F1NcsaraxfsEx7yU
	+y5MpC84HalVH4O9yiQCYxWIc80crM79vF3Ttg/m5E9bzGl2zLlsG1KDBmS7ZMz9E0VQANXMUpS
	HkPqxQV4KF9/ZY4ltmreedjRlvMaVBg+136MHIPdhDlZ1I706wQgy3I40WL6XpUmmtilQ3CEupD
	S3t8NBrzPMjTgZ6VCsmAEBQEEsp/b2Un5cYGjC3VpUm/GiOt0mGaEEH4sPP7OKuh//14ZI/rIi/
	+nYdZ20K7vqIxGbiEni5QvGllqD9RiwxpiKZgIQUX/UbRlViIWvBdFBPF2mdKEhUK3QDD/lkZW3
	YTNhzF/TuEYn2mypvQ2NHk9PBzdsb8Y6SEc5PCbuhZU04
X-Received: by 2002:a05:7022:2608:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b5568b678fmr19109370c88.6.1795499753311;
        Mon, 23 Nov 2026 21:55:53 -0800 (PST)
Received: from l ([2603:8002:ea00:6800:e2af:cae4:df96:350])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm30436286c88.0.2026.11.23.21.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:55:52 -0800 (PST)
From: Dave Seddon <dave.seddon.ca@gmail.com>
To: netdev@vger.kernel.org
Cc: Dave Seddon <dave.seddon.ca@gmail.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	David Ahern <dsahern@kernel.org>,
	Paolo Lungaroni <paolo.lungaroni@uniroma2.it>
Subject: [PATCH iproute2] seg6local: fix crash when next-csid ends the command
Date: Mon, 23 Nov 2026 21:55:51 -0800
Message-ID: <20261124055551.3390282-1-dave.seddon.ca@gmail.com>
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

ip crashes when "flavors next-csid" ends the command, with or without
"lblen N":

  ip -6 route add 2001:db8:2::/64 dev lo encap seg6local action End \
    flavors next-csid

seg6local_parse_flavors() steps past the last argument and passes the
NULL terminator to strcmp(). Check argc first.

Fixes: 04a6b456bf74 ("seg6: add support for flavors in SRv6 End* behaviors")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
---
 ip/iproute_lwtunnel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ip/iproute_lwtunnel.c b/ip/iproute_lwtunnel.c
index 9a1e747c..53004b5f 100644
--- a/ip/iproute_lwtunnel.c
+++ b/ip/iproute_lwtunnel.c
@@ -1434,7 +1434,7 @@ static int seg6local_parse_flavors(struct rtattr *rta, size_t len,
 
 	if (flavors & (1 << SEG6_LOCAL_FLV_OP_NEXT_CSID)) {
 		NEXT_ARG_FWD();
-		if (strcmp(*argv, "lblen") == 0){
+		if (argc > 0 && strcmp(*argv, "lblen") == 0) {
 			NEXT_ARG();
 			if (lbl_ok++)
 				duparg2("lblen", *argv);
@@ -1444,7 +1444,7 @@ static int seg6local_parse_flavors(struct rtattr *rta, size_t len,
 			NEXT_ARG_FWD();
 		}
 
-		if (strcmp(*argv, "nflen") == 0){
+		if (argc > 0 && strcmp(*argv, "nflen") == 0) {
 			NEXT_ARG();
 			if (nfl_ok++)
 				duparg2("nflen", *argv);
-- 
2.56.0

