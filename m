Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495379;
	b=NIcan/md/ooT9rLHQAm69+JNFhR/lL94vSen2NFMbgyYX9I+hiHORCdnktH7sN+igqiM
	 MPzDnwjlRu/x5gO/3ejsry4ojpk9HI4GuTQDgGSjtf732elIiKruq7odLzZsmj9+lVCc8
	 CFVqwZ+chHkogKvVD3e1KSyD26l2XelHb1EcuLFcKry3u8grdZILdCkZE7r/ZK5wTVgAa
	 mj4d504808W3pLLm0sHfV06+NcFZ0cn4ZWLJPbzF/GaSYoQrz07uBsdTjxZPT0uCXm2aK
	 0/cJanvwYes76zg+OdfZoKYaCCmxGtdkDR/o3ErS7huKPotN3dCTwXHezT52Dbopblw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mgb8NPEDQAhabDl9XbmMIsbZ+qr2JkyUbDG9DbSPShw=;
	b=Qx2VFxvdyjrfdROUiYW5U0gOSMHjiaGzx/vaeeHbAGx2j+piQbiW5OuvjfMSyZ34ZDo9
	 EKwdz7xuWyYbuddZuBKFdXygVvLedxqAke5QCSiC6cO1ec7xJaZawQx1pnGRSoB8sLFHu
	 wvPuu2UWEY1NxQHQ8gpJQuRQBxksgsu1zjKlYj2JO+QKQnGifBVDM5mVoZElEvKrjJrDm
	 7MiTermQmBlGnGrp0QcWOUEuO6JaUPDnDoAwyhuPv7ADv3wWEF12VhHx6PMPpBbxqtJRt
	 pEDCliv2+3qk/s8qad2ZNi7XEWdS6Ias5KPdK9MqF9kuChDSW9zLHtJcDf0vuHrXQIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fHU46/Kj";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D8060A2606
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D8060A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fHU46/Kj
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386bd881d39so1268740eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495378; x=1796100178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mgb8NPEDQAhabDl9XbmMIsbZ+qr2JkyUbDG9DbSPShw=;
        b=fHU46/KjvpMZQYKPo4HLXNCfm0+Rfuf//E8ToI2q2vV9H9pD6U8dF4+urDo2CMQqLf
         b/eqGVK38OW+/Equlc1s+NuCi4ALa6fmsLOBTLfmEHE6bLMrhvzsxAsyNiz3J8M0lxfy
         MBQ3FNgiVSNCk1SriGBdltsvT/fL9xyPcwLdMKfugD0+BvoKwVRDkslAeSaTGvF2wD91
         A1nKNrPdwk2wnN0CZTxWB4UrLgtJCLGnguhIyCnZbhQYYaEzPpfmM9T8sW4bX5OiSIJx
         DyE1FAlWbCe/nNGa2api/palYm7VD3jbWhFT4w1uyGFCh23j7i1XJkoXfYTEGuTnc5GE
         LCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495378; x=1796100178;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgb8NPEDQAhabDl9XbmMIsbZ+qr2JkyUbDG9DbSPShw=;
        b=16DCF6m2y38NpaQNRqqYunHlIw+eC74clvXfOJWYrzFFudeVJSmy5U2FhyYKCGF6Qj
         RBFpAiyPEPc+e9elepxhDs1hp0w5mLXOvKXLXDy9Za7HYzaHHGPwb7sh/ZQkcqYicAfK
         RDDVmeLfeb8uc8U17e33Wg1ZC+2csuAg2nEJuKwug4nKFa8xo7xAwtRsOv8cbtnmKE/D
         ZXNKBnQBXpoIvFxf35gAM/aKhR5PnOBU7gZwWCc7iFXuLnIlvXx5BTe1FQwLWwDLHm30
         HCP3yH/s1G2jge2xgNLJZJ/jLyjLXWWaKOzxeAiB48QsUecYlNFpaO5BsIV+hqdlFo1N
         MpLA==
X-Gm-Message-State: APuU4Z9pBIwbWANxGoe4sKRTyniHPQnGSJ/4ebm63MCmktvWaPEqk+0V
	GHLSnorJTWOuLRkCdKk6VrItNi/g/qlt5DOT32jLrcOWyp5cLVvTgMo9
X-Gm-Gg: AZFdTZe5k6D+1o7PloeDW7qqBxhepnuyJ1igVIOQ11KE7jdCY3MoLRKOzZenXnqwO5a
	N37Uv11vH2Yu/eRf9YKzPUSolvUWnS61KOm8geS4S7pYxZeZ5XszFZgJxXGD8wpwoXxZYlqp40X
	J5Xx8OMDKK/8YE7mzUb61+1o5lR2w9fw5TKy0G3P8zkl+NmDDIpYnI6jN3olOqRBncDoyer9RT7
	3oh0lKKwR7IPLIY6ZdZYFuAWUXeCFKctA77u49+18DZsq1OT9YzTFQGgDArkV8YFS0tEBi98/Gy
	XLun9/m0Xwlp8PyPeX1Y7nUMG3NIjaAr4C/Vi3KLtW6OdhB7WSEoZyvibvERiD2S0L63yFWxHiR
	2cyzOB+zAuWffhoFip8JEQHmOi2ZfgEdCBKVYL3kQUW3Am9eaM//fZaecqWd11yHtqq+dKSqp8A
	/B3xTh8WPagZ/6sVAGaYsBin+/oZGX0Ra5AlOCa7iAjuoGXNMm2gLhUhNdl+3RagANgS6RaNOn3
	ma8eXxapDud+o5ZWzqCPqSSSovr+cwJRBGQ+733QGcoUPtXk6wPOruI4urAkpoHpZk0/CoT+kv8
	EAkaZdSkxWcz8wMSUrL7LgULxQr8MCXS11xDb5XoTkzmhSe43OODv3QqM/tdeakU0RiA7GlgmYs
	GOfoCFKIJDyG948tvyQERKxHmUxC7uvflP3MYTheJ1jFdvDrQiJkhSLS5GINJJ3b3D7rIo2VN
X-Received: by 2002:a05:693c:8083:b0:376:6530:248f with SMTP id 5a478bee46e88-38570a3717dmr16070179eec.24.1795495378467;
        Mon, 23 Nov 2026 20:42:58 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm39913328eec.15.2026.11.23.20.42.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:57 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: Re: [PATCH net v4 3/5] ptp: ocp: preserve disabled SMA inputs across driver rebind
Date: Mon, 23 Nov 2026 20:42:56 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-r2-ahmadexp@gmail.com>
In-Reply-To: <179548551472.3135.11972018356692852897@kernel.org>
References: <20261122-timecard-common-v4-e0db4ab1aa-3-ahmadexp@gmail.com> <179548551472.3135.11972018356692852897@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 24 Nov 2026 at 01:58:34 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Low]
> Does the ADVA X1 part of this description still hold for the tree this
> patch applies to?
>
> The previous patch in this series, "ptp: ocp: handle hardware selectors
> and combined DPLL input routes", changed ptp_ocp_dpll_frequency_get().
> An input that fails the exact match now falls through to the
> combined-destination loop instead of returning -EINVAL:

No. Thank you for catching the inaccurate incremental description. After
the combined-input patch, a disabled X1 input with raw selector zero
already reads as zero Hz and can be re-enabled through the DPLL core.
The explicit SMA_DISABLE substitution has no additional visible effect
for that X1 case. Its effect is on FB/ADVA, where zero otherwise matches
10 MHz. X1 separately benefits from recovering disabled state on rebind.

The v5 series says this explicitly. A boundary test runs the actual X1
getter and DPLL core get-before-set path after the combined-input patch
but before either disabled-state patch. It passes disabled-to-PPS
re-enable and output-to-input direction-change recovery on all four
pins. These are source-derived tests with stubbed MMIO, not hardware
observations.

> [Severity: Low]
> Should this also have a Fixes: tag for b2c4f0ac53f3 ("ptp: ocp: Add
> ability to disable input selectors.")?
>
> The init-time recovery in ptp_ocp_sma_fb_init() fixes a lost disabled
> state that goes back to that commit. It added the software-only
> sma->disabled flag and the SMA_DISABLE substitution in
> ptp_ocp_sma_show(). It also added this write in ptp_ocp_sma_store_val(),
> which clears the SMA_ENABLE bit:

Yes. I split the old patch into two independently described changes:

  v5 patch 5: recover disabled state at bind, with
    Fixes: b2c4f0ac53f3 ("ptp: ocp: Add ability to disable input selectors.")

  v5 patch 6: report disabled inputs as zero Hz through DPLL, with
    Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")

Patch 5 contains only the initialization hunk, with no DPLL dependency.
It applies independently to the current net base. The base reproduces
the lost state, and that patch alone passes 243 modeled FB/ADVA/X1
initialization states without calling DPLL or writing the mux. Backports
to older trees may still need context/name adjustments.

The complete series also passes the rebind plus DPLL re-enable tests,
4,669 input-route combinations, ART and DCF frequency tests, and nine
deliberately broken routing variants are rejected by runtime assertions.
No physical rebind was performed. Vadim's Reviewed-by remains only on
the unchanged DCF correction; I have not carried it onto changed patches.

I have sent the eight-patch v5 series to net for review.

Series:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com
Patch 4:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-4-ahmadexp@gmail.com
Patch 5:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-5-ahmadexp@gmail.com
Patch 6:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-6-ahmadexp@gmail.com

Ahmad
