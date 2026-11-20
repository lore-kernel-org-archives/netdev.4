Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209707;
	b=0gQlnP46S9UyjRBPFkvZ5vO00qvgYVvVtcf6y8fTiJVCfFHrWtgeE0sNe5Y5T5Iy1y0J
	 mbaaVHfdj3gRnpNFrcU79KokKsCSJb+EOyrT02cxsS7R2+e5/UsIwzeMSbDP/XfN/l1l/
	 U6KWyWva6yp3iUV4eCRrX6NFeLrca++K+av5Wt4T5dC6Vzd6Db+oGLVb2unIIr9/z7i7D
	 1c5HsUumop/hvg8qDS7zluxFvAhTeWe9FC95fKPIpfgyiTfKj9F6Kk6NIe1JUunIHyQFs
	 AucYvk+w4zNGiAt3GV3RpWU0DMNW6phptRCmNQvcH1+CwNYcAayz3TiQQ4iq2VCPCpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xUCA4+MsnfN2jpXlI/9WdvpG5Tt+EKUembZWW5z5nM0=;
	b=D9iTfFzCgiehCZoCqdHuBxRrgoWhw3bM8GqZW8lxnl4/EEZ8M4rq/Dguddy2uTNFQr7t
	 DE3djhRp5iExljPOvi26iXlK/u7Pev0OCKsjAOmh/zqH6XO9tlKs/Qe33dUdiFWuhn9Uv
	 iGFyuSHCRjZyG2M+R9PCwT5A5Y48gZ6pVeg8+iq49inT/XxZDydpNp/2sL0UAyMDt4FEp
	 aSXfIdG7mB+kKXm83YUMsikPmFlGfDiV5/e1I17m0YlXLAXLjC5VHfyOZRip5PQ/2oVoC
	 E+9G+80LxcdKio7BZoud8fujXlwq19egf9LYU2itbYZL7vzpvM8Zr1Z+HjXEbGS5QqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxtlCoG6;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35342606A686
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35342606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxtlCoG6
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so2953029c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209705; x=1795814505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUCA4+MsnfN2jpXlI/9WdvpG5Tt+EKUembZWW5z5nM0=;
        b=hxtlCoG6YbXhy9s2WCJy/Zw0kjwab3ziMzhxd2INDRM67FNCxOcXBKjilrqhq2kRba
         un3MKXNKM1v2fmwm8IdiNfwp5kjOjS6u/vNmfjPuDX1Ii+XWUq2XvVbi0S5VYDd2uhbg
         ga40i5MShCHRNpNZ635MHCALYSgRMJPqAGdB3Va7nFG6mjoHKzcoJ6ZEDwuhLkobMIXk
         n2ThyGKTqVE5JvZMpFojireigO4FCfwBwzRjmuLlkhkjoW3UrwR0r226JiHk5oCiZKsJ
         zx+ZVe7xxeQY20wKqqV1wO9X/FgLwMH7Z4YBiYRQMPXcKcj2elXn9YZYNKPp4w314yN1
         jjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209705; x=1795814505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xUCA4+MsnfN2jpXlI/9WdvpG5Tt+EKUembZWW5z5nM0=;
        b=vWXBJb2J18EDqRECMMbg4idIfH6eOIaD10BdXuwcA3IBih3axKC2WgCAIxP2NbHVhq
         jPb47hUIqs+r4sop0kcr6975DoS6swtGhnAyHTmegjU4fQe/khRN6RRv7BuPzFDY1mA5
         igPWEDBD3o5hCZZgsM6DFnvcIYDthjJioHAMkijJ0GDdBIsGiOn76OXrY0rq3hmDV7Fr
         5tJDb6tjT6WCuHgO7TcPOrKk1XoDJwv7vv4SjbnhU76l8jktoRggCxIvQVLyBD92Joov
         nns1mGG1xkYiSe00JrSzT2uUULbOSXBLvzSlPgCDpWVF+crEkjZ4kaDhUw/oLlN1OPuc
         NVEA==
X-Gm-Message-State: APuU4Z9wZ9pGBLLD4ve+kFNZAnwNTde6uz+EeZLTD1eNkZI39qxa3VkV
	T20VCn5PEcI/WM31AL0bAZaMJb9fAEDulPlBnftV2S1fLrkYPMnsl8YV80/6opiy
X-Gm-Gg: AYBFou0PM94BbY6mK73FhnSRjNebYdkFWKCefKiH9IOswtghURtrfRWOIkLLHTfcKHf
	ghX5Vn3opVfOZFISNQYcmzQQ4ZJoyVprkftki40tYl07pQ0IojGOEMvXTPw8tSFwfxzRHAHRTA+
	MjdtmS+zuMVgefPRcyGbRsmDLOML0O+fGJ5KME0gVT9rN5j+a2WBWpSdgGBt+G2ncGfDgXO0f5C
	QR/2xAgKe4sSx3lcsgzfAghpGlRD+yHzM201lNWeRH746gdmHsrSQJejvR86msyEq9++cxyg4hR
	0Q6AOisJk/YbAZW1aQ0yaWyNDeO9FE5n27eJXJbo0l6B/O6UN3kwhat1dlo+fx8KFTQOJx1mbJN
	vKOcOMBg30UIMl37u6Ku+cT5O4u2Gvzao1dyQ3jkcYmgQVtFGzxLoEGmVhPKf646y8fekw65rkQ
	kNl9XqwpTO+Rm2RBawjavspni2x8SQJpoiW6KRM4izBsSchci/ZzwN9DvDJ59fzyiIC5c2L6I89
	t8FA6yyIPbA+C+3xSwD820nAjT5Zw6bOa2FQlPIAtwSj3U7yn3ki84gQZAyuty2OCmTOSGmj83w
	ng8B3fCNTpf3zqHgEllFmuQ+uz8qkb8/EvlwrbJ2WeKG6BsqLt1CDS52J5k77+CFpuLAmsruM5m
	fWZUCdjwiwOpjKfkwGLapqf1HJpUs
X-Received: by 2002:a05:7022:5f19:b0:1ae:e0f5:2cdd with SMTP id a92af1059eb24-1b556903921mr4186130c88.28.1795209705301;
        Fri, 20 Nov 2026 13:21:45 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm13411153c88.14.2026.11.20.13.21.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:21:44 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net v2 1/4] ptp: ocp: prevent timestamp rearming during detach
Date: Fri, 20 Nov 2026 13:21:43 -0800
Message-ID: <20261120-timecard-common-v3-33316bf475-r1-ahmadexp@gmail.com>
In-Reply-To: <75abd6c6-f0ee-4665-9451-05e0e1a7a3d7@linux.dev>
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com> <20261119-timecard-common-v2-078fe69f33-1-ahmadexp@gmail.com> <4e42134b-b017-4836-9772-9c1915b16e77@linux.dev> <20261119-timecard-common-v3-discussion-743fce65f675-ahmadexp@gmail.com> <75abd6c6-f0ee-4665-9451-05e0e1a7a3d7@linux.dev>
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

On Fri, 20 Nov 2026 at 19:31 UTC, Vadim Fedorenko wrote:
> On 19/11/2026 23:46, Ahmad Byagowi wrote:
>> On Thu, 19 Nov 2026 at 22:23 UTC, Vadim Fedorenko wrote:
>>> enable() callback has to set PTP_PF_EXTTS function
>>
>> Thanks. I tested the cleanup path. Recording an assignment makes the core
>> disable that channel, but ptp_ocp exposes six timestamp channels and only
>> four SMA descriptors. TS0 is the internal GNSS source and TS5 is the PHC
>> source. All six can be enabled without pin assignments. Four descriptors
>> cannot record that state without rejecting requests or changing the pin
>> interface. extts_enable sysfs also reaches enable() without an assignment.
>
> Fair point. Pins are pins, time stampers are time stampers. We have to
> disable things which may trigger interrupts, the time stampers.
>
>> Would you and Richard prefer disabling all n_ext_ts channels in
>> ptp_disable_all_events(), followed by the existing PPS disable? That keeps
>> cleanup after posix_clock_unregister(), without inventing pin assignments.
>> I have prepared and tested that alternative locally, not posted it yet.
>
> Yes, it's better to make correct core PTP cleanup function.

Thanks. V3 follows that direction: disable all n_ext_ts channels in
ptp_disable_all_events(), followed by the existing PPS disable. Pin
descriptors and SMA routing stay unchanged. The driver's preliminary
timestamp-disable loop is removed, so final shutdown runs after sysfs
callbacks and active ioctls have finished, while the clock is still alive.

You also wrote:
>> I also removed ptp_ocp's preliminary disable loop. Otherwise it can clear
>> pps_req_map while an in-flight enable subsequently rearms the hardware.
>> An overlapping sysfs/ioctl request can likewise leave an empty map with
>> the source enabled, so the final disable now always masks and drains an
>> empty PPS map. The shortcut remains while another subscription is active.
>>
>>> why do we need it now?
>>
>> The v2 teardown exception covered a disable that had cleared the map and
>> dropped the spinlock but had not yet completed synchronize_irq(). The
>> previous mutex version held its lock through the IRQ drain. This local
>> revision removes the stopping flag and its special-case condition: core
>> cleanup runs after active requests finish, and an empty map is disabled
>> and drained regardless of its prior value.
>
> Could you please keep more context while quoting? It's really hard to
> follow the conversation otherwise

Sorry, I trimmed the original question too far. Here is the code and the
full question from your 19 November review:

>> -		/* if no state change, just return */
>> -		if ((!!old_map ^ !!bp->pps_req_map) == 0)
>> -			return 0;
>> +		/* Teardown must drain IRQs even if another disable cleared the map. */
>
> there was no need of this in the previous patch, why do we need it now?
>
>> +		if ((!!old_map ^ !!bp->pps_req_map) == 0 && !bp->ts_stopping)
>> +			goto out;

In v1, the mutex stayed held through synchronize_irq(). In v2, the
spinlock had to be released before that sleeping operation. Another
disable could therefore observe an empty subscription map while the first
disable still had an IRQ to drain. The ts_stopping exception made detach
drain it too, instead of returning solely because the map was unchanged.

V3 removes that flag and the added spinlock section. After user interfaces
are removed and their active operations have drained, core cleanup disables
each channel. In ptp_ocp_ts_enable(), the shortcut becomes:

    if (old_map && bp->pps_req_map)
            return 0;

This retains the shared source while a PPS or EXTTS subscriber remains.
An empty map always takes the mask/disable/readback/synchronize_irq path.
That also handles an earlier overlapping sysfs enable and ioctl disable
which left the map empty but the hardware enabled. This final shutdown
change is not a claim to serialize every normal-operation sysfs/ioctl race.

The refreshed source-derived removal/shared-PPS tests pass 100 runs and
reject all seven deliberate regressions. The routing fixes are unchanged
and retain your Reviewed-by tags. I have posted the signed four-patch
v3 series to net in a separate thread:

https://lore.kernel.org/r/20261120-timecard-common-v3-33316bf475-0-ahmadexp@gmail.com

The cover links this discussion and explains replacement of the older
pending series. Thank you for reviewing the changes.

Ahmad
