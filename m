Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131973;
	b=JViUmwP+RAIZvZmbpTM2SjdiOznyC1O5wWZPTBoOhtDMexyL02P39HtmTq0RJBO3R42l
	 hWshIC29fg6tfqEDrWnKGPVaUDnzBYZeKb3Vy8Ty+AvFRItkcDORH/1V5HqJkx/OXEi2z
	 DFc2LKTjgSea7R3YvOBnpvgGNf4tJghsemOJ9Rk8nJVE1iwrlnjCgwZVSY+2zS+YQsu38
	 bbi/VDAgxRV5GfgWXwZusSWuEDsBk3xe+snifGG19lJtzndGHcnFKP65F6eK0s5dPyCDh
	 w3JZ9mYen9G5v1UpjI7XcVdx9OHQetQW8K6qYBwkrTDzLUnzNdEq6BAJZkjHRp3cGbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=snv6p6hL7glNU9Kbc8Q6F9OHOb2I5IO6GSKTn8JSsTI=;
	b=JVykcHVbD4lrEOeC8YmvQTxPnPqALqbt90RLeCqc4HKlrhmN/4oBZ/6z+21lptekX/QN
	 4VTMv+JGVim5BvXCWgW2ccjVlOMNvp+acWIkuh3NNYOvkSf2Zv32gaA/BDTf6aXnm5UUQ
	 o3FomkCgubNf3sL/Su+aOw0+jutxL4VlklFN2NzzCtmN0bgOjp5j3EdRn+C2UH9+Xchgr
	 sYLmQ/mSBz6C5Ge1kIeJWbe2DsyLAB33G28HQ7Z4q6fhRCxO016X/HdaAZJrzW6yOXLEF
	 kWR5WRPg10GbG0Lq0UkLgRSKE8i4ZZ1WUTmaIuq5MRKphNkV6tFW244bxMS1WsM7aYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TdwXmnD7;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5CD606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA5CD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TdwXmnD7
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38431138772so330060eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795131972; x=1795736772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snv6p6hL7glNU9Kbc8Q6F9OHOb2I5IO6GSKTn8JSsTI=;
        b=TdwXmnD7F5uejcWgqjte5YSJ0bplxxEyIMBJvP/Ifi6FHifHegtfoVOUEDOBdy7Ndv
         bRX+r7tojJFml24o+GCvEzCOmBhmKK+FUbTbFmiryjRdjRm2tiJQkeira/E+w6ThdO2m
         THXbOMdappF5+XQ5viwdYMar6Yv6KXexdfO1Zd6LaluEq604Xwcn5sMW6HKvFPfBBxkn
         SMZUEp2DClQ6BD2LOCJUPNJZjSCyqYre7EeYguRZ7ZhqmnTwGMoAbXOCsny4FJzgNWn4
         9P9rJ1cZXysPlMX2kob6z8OcGiSKDtaGzQRqdEbGo/wTWvNszmDehSBLEb3JWNn+a0lt
         o1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131972; x=1795736772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=snv6p6hL7glNU9Kbc8Q6F9OHOb2I5IO6GSKTn8JSsTI=;
        b=twhHEX5bRmRYMThIkyUUDho6GnvQo6d87Kp+6NewYbrefQfEEhSw0WYB7ZPsSfPahI
         vEe+FWyYy5GzCcBLabpe0YiM+sm6QBJZXszdaLEuvbVFlF9ky4JJsHE1S8IiCWjAEHU9
         1yt46wTVRA0S9rJ4bK2R+gcjKE8Zy8hTX6PL5n9j163nuN2Wf7oilZ9le6BpphXmvZgT
         zyQ8AZrkIih655su0v1/k/CpEC/kupgaZTM58zjoateL/MnUL7Ybv3eFwDKNv5Es0iqB
         grSpQ+l4dzBkF6fq1yFj2/xW95T1/0C0t750FC20rK0NvPrsFcAf0gJjjnBbhJfs8+td
         De5g==
X-Gm-Message-State: APuU4Z9AWS5TvOSsE+Glkn7/MwbOMKgLg89VxxrzDHCoPTik10YAbcs2
	qOL8O0ypeoo2dTKhMWosn5X03uRkr1uRoGwglbqsqvmjgLzXv5dk2+Y2
X-Gm-Gg: AZFdTZfoFeI0G+4RB+HJSnrKgOY1azACdI5P4iJi+3czuU1ciWJL08NLpA6okQC1mJA
	HYgRthxqfl5aGLB7XIsZOewI/89DMYpQjyn/Udynq1l1LzKyvIUqdsuibmPueCW3YdC1IhTn8d1
	taAO6z5542guE15Nzbs5NcNqItS00I6duRPm8eDCkp31ik8CRVjGAbONrwgF3ITOt2L3JbNXGOP
	tOLkQ/wo5YInoRUPLwIqpo6DUZLgEblCN2WioSkChQDYI/B4qzzZoCqQylhoisKsqWpsDjjBqqa
	dsE3EXa92B3t/EHTsylhxUeIbB4aQt+Md8YPRKzphA09YLVCgZhNYTZWLnZs60q2/FxiBd/vSAb
	r8JunZLJS7jhWk8bi3pHzA91MsE+3rjiJRXfvtq/NlsFvX3lWeTqF5F7NMm5vxglxmnhd9gZ0V4
	6013PQ06fhiSyeI19Wj+47dTfpwwCEx1iFlpBLOlPfE2zbwwj9ygg0y2MDTFQOehXJxPTHuXvQa
	dvlZFuV5ItrnCFVVfjpoMN6wYT29SevgVHkVmCmMzjm+zszneSuJGVJwyhqHMlUPtNvXU9LPJ0I
	id86ROBYnV50vf8BF3P2NsNg/gNsbqutPy1oZ6KTNaM7Kjr0ed/8YmNSCzIJ0tE3+SPROa1PeNr
	epagEt6dycqsIA7GEbbbggRnRTiMdbp3i/ju0TGsqzf4GSQHwEyrQnetyXsWazLieF4D0ETYCqm
	+Yqs9cYdh/+0HebX95lg==
X-Received: by 2002:a05:7301:f23:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3857045249fmr887394eec.20.1795131971809;
        Thu, 19 Nov 2026 15:46:11 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646632b9sm2095662eec.1.2026.11.19.15.46.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 15:46:11 -0800 (PST)
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
Date: Thu, 19 Nov 2026 15:46:09 -0800
Message-ID: <20261119-timecard-common-v3-discussion-743fce65f675-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <4e42134b-b017-4836-9772-9c1915b16e77@linux.dev>
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com> <20261119-timecard-common-v2-078fe69f33-1-ahmadexp@gmail.com> <4e42134b-b017-4836-9772-9c1915b16e77@linux.dev>
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

On Thu, 19 Nov 2026 at 22:23 UTC, Vadim Fedorenko wrote:
> enable() callback has to set PTP_PF_EXTTS function

Thanks. I tested the cleanup path. Recording an assignment makes the core
disable that channel, but ptp_ocp exposes six timestamp channels and only
four SMA descriptors. TS0 is the internal GNSS source and TS5 is the PHC
source. All six can be enabled without pin assignments. Four descriptors
cannot record that state without rejecting requests or changing the pin
interface. extts_enable sysfs also reaches enable() without an assignment.

Would you and Richard prefer disabling all n_ext_ts channels in
ptp_disable_all_events(), followed by the existing PPS disable? That keeps
cleanup after posix_clock_unregister(), without inventing pin assignments.
I have prepared and tested that alternative locally, not posted it yet.

I also removed ptp_ocp's preliminary disable loop. Otherwise it can clear
pps_req_map while an in-flight enable subsequently rearms the hardware.
An overlapping sysfs/ioctl request can likewise leave an empty map with
the source enabled, so the final disable now always masks and drains an
empty PPS map. The shortcut remains while another subscription is active.

> why do we need it now?

The v2 teardown exception covered a disable that had cleared the map and
dropped the spinlock but had not yet completed synchronize_irq(). The
previous mutex version held its lock through the IRQ drain. This local
revision removes the stopping flag and its special-case condition: core
cleanup runs after active requests finish, and an empty map is disabled
and drained regardless of its prior value.

The source-derived ASan/UBSan removal/shared-PPS tests pass 100 runs, and
seven deliberate regressions fail assertions. Five KUnit cases using real
PTP register/unregister pass in QEMU with KASAN and lockdep; the old core
fails all five. The KUnit callback models events, and the source-derived
tests model MMIO/IRQs. Neither is a physical Time Card removal test.

I have preserved your Reviewed-by tags on the other three unchanged fixes.
Thank you for reviewing them.

Ahmad
