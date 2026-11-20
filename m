Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141930;
	b=SYK5kNdAzl5wD2aJvifo5LUS2s/4dBGnAjUAVePKfRO+iqBEu8RxKSGrgrip+MzVi4JT
	 kCP6hu9V6bVJa4XXuxKqq/h4tfPcyJbzVS2CxRbpTf7n9fLSCsHKytYiNUybHcU7Y8UWQ
	 wm6j6cyc/zQcKYusB7mwOFhPVmveHyaOabvXcEGP4UaFH0C0qc0KdSwzOdvu9VLqw4VVD
	 qqta6KoKIf/TBAIQA9GdVO41R8phMM9LrVWP9VQTQGNkx6kEoDdUSXCCKu4l6t4JUE/tZ
	 mo9MzMAR2zA+MhCLA/mwc9INOem+g6j299LvOorWE1LZFhbjwRGgWEINaGGDGzbJvQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pWuIyURNX/lfKFl6nOlQJf4vLilIRP4zljyZSwPK/8c=;
	b=AM+km6tbp0mndVQP0LFB1tFldO+tSB1EmLzsOzlhbvXr0IYu4sXPkL3wF5HlKUSTZjRb
	 KlD+YdhCBk+cCg7N5ttD40eaLdQJ+n8S+GD1VkuKKLsEuzHY5gWEZUZlkYXP/5wHE2Bi4
	 YJ4gpsLc5Rz4uQ3tZGAiF04SXYCl3XkhbrSHm5lJFlJT4Qo0x9Nq1ItOXgUFi2uJMW7VK
	 l0OTlg+jC4oNVIkTT2eZQpMzDtiFcomQxymWBbtb+Y9GyFf+H5OtY/FV+7CkP7fi0QHZA
	 xfZttFBypDT5ESnQ3bNTvPtKNktlECubR6xISh56gfhuDc7gKDOtBymogypxGukZg+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wje2tnkq;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0349A606A339
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0349A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wje2tnkq
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f02ee04378so3147925ad.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795141929; x=1795746729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWuIyURNX/lfKFl6nOlQJf4vLilIRP4zljyZSwPK/8c=;
        b=Wje2tnkqJdZ3uK4FUrG/JgEz3i8faw+6fym20oxZOBjFnbuz1zOaFqdhodny/qWU8V
         zjJXZuaM+y+7ufQnBaHi6RspEjYKoFpaQ9jFGzhXl1a8toMI6MWzS3uckyFyw5AozALx
         pkWNOIzAbgx98dfSPa6oucS5t22+YxWmgrIjy4m/hmScxYwycC9G8soX2KfMhIM747Es
         F2/MruHxxv1+5es1WI6yjX8QMSB9QHkXgro/z+62z+ywIAb0rPMeFq0+lPZIDgHBfipx
         xleVkrAkku0ADl/iZu4Zk9gHBvdDFPHsGSeKSnnYV8tkvslNneZOr+Mih4Z8NzCIDvR6
         NdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795141929; x=1795746729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pWuIyURNX/lfKFl6nOlQJf4vLilIRP4zljyZSwPK/8c=;
        b=rCHSBr5DJZtkQq+gLaUHSDBImZXvryuT4pX7wdJvCUVuxAVSPaSfL7WW25RyvZeIla
         8u7uJo/guuIGFTdVdb52O48kjvSA+DqiqyohtgArikNv6jRg7cDz7zF0Hf99e0AYeY+Y
         Cmp1wI10k6RgKog9MbfUmP2or9BrpBHeY8TGBV5chMjEnQ1U3zMY2W3A0sVbxQPrQzG7
         iaW3/Tr30lCTe1pgzuZlU4D3j9NeutnvKyoySzsXsBqanLoLsn5d1Mg8y6kV/lnBGZw3
         YApQCjsCMdWVZxICRcdbe71FL2vBxCXeMWeJqwvGwBIc/vjeGv4EBqdYPnE5RmyZlmSe
         teGw==
X-Forwarded-Encrypted: i=1; AL+hErGmflVtcGrEHT53DMrEjl0w2pxwuksDUBQTnYP3FNg3ADPlIK2BoNYffHBGknIGnlaHpHs5E4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CdOAyTKnqyU2kEZGguOviZWOat4Vo4qw8Ixz4MGw7hB+ll9Pa
	9UYOKNQbrQctrlaVDa23R5HyBeTtsFVe3ilRJOU0lmWeewaIfYjlvAUv
X-Gm-Gg: AYBFou3uJFCStB4d30FVW/IUhbMRUPjAAgc8Hm6AsjrP9xsJRUYcR5/PCavj/B0PfDh
	W73hGrM5mD9lVX5MKWIUjAam8c4K4o4KOto8T8gX4wmLYTvNgkK7ButXpkeoGOEhUJfMdoR2oPH
	38sRB+Zg2Nh7rU2DtY/qmb5Ss9cdVTTSRNMIcpy7PhEVpLGIUU1iL4kj9fcvY48FbWp5/jkbhvI
	zeuKQDALmBcsUssKZ1DGtAVOeJop2dfYh2bhqK9C9p/0CSL/LoQ5fgGOlMKohJN4lfYI5RlotKo
	/lIPlwLWQcBd0kwRu0G3OHSKdm1vdOYsSvgCKPDWunLtBWTpSIrre8170Tz+cS9AW9CLh5eO9CO
	zHihaXgA1yLntROF+HfkmmiZAH06+ZPyNm8px4tG65UkfWzhcxypkhJuJq6nCS5Gc1FhO3DzRfs
	HaaCrKQ3eSV5h7fXlI9yVsvOUdBMIYMJHv/b3bRZ5Io8EfW3+MajrcTJe0TQ+W4fFOPlXJAo7AU
	+9Jr7KnMQyU6rTzF6jhlQdf4dB3D7Z+IoCVrGExSyl70Vn+NFZev0XquYOh56xG8l1xNYlmA1gt
	ip6cGnXilx2JjiUydZpirsanu+mGfGDH703rTpjOPlH4cNDuh38=
X-Received: by 2002:a17:903:41c2:b0:2ef:dd60:39c2 with SMTP id d9443c01a7336-2f03f1ead28mr19012425ad.29.1795141929147;
        Thu, 19 Nov 2026 18:32:09 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ad2sm7123995ad.16.2026.11.19.18.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:32:08 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: ah@foundata.com
Cc: Chih.Hung.Huang@wnc.com.tw,
	andrew+netdev@lunn.ch,
	chandrashekar.devegowda@intel.com,
	davem@davemloft.net,
	edumazet@google.com,
	haijun.liu@mediatek.com,
	horms@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	johannes@sipsolutions.net,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	loic.poulain@oss.qualcomm.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	ricardo.martinez@linux.intel.com,
	ryazanov.s.a@gmail.com,
	tim.jh.chen@wnc.com.tw
Subject: Re: [PATCH net v6 2/4] net: wwan: t7xx: do not exit the TX push kthread on resume failure
Date: Fri, 20 Nov 2026 10:32:00 +0800
Message-ID: <20261120023200.133268-1-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106054532.201311-1-ah@foundata.com>
References: <20261106054532.201311-1-ah@foundata.com>
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

Hi Andreas,

Thanks for the report. The trace matches the sequence described in the
commit message: pm_runtime_resume_and_get() returned -EINVAL after the
runtime suspend failure left dev->power.runtime_error set, the thread
returned, and kthread_stop() in t7xx_dpmaif_tx_thread_rel() later ran on
the stale task pointer.

The fix is v7 patch 4/6: https://lore.kernel.org/netdev/20261120015556.131547-5-tim770802@gmail.com/
Its commit message now describes your case, including the remove that
hung in D state holding pci_rescan_remove_lock, and carries a
Reported-by: and Closes: for your mail. If you would rather not be
credited, tell me and I will drop the tag in the next revision.

> One question on the retry. In my case the failure is permanent:
> runtime_error is latched, so rpm_resume() returns -EINVAL from then on.
> With this patch the crash goes away, but TX stays dead and the thread
> retries every 20 ms for as long as the TX lists are non-empty. Is that
> the intended end state, or should something report the dead data path?

The intent of this patch is only that the thread stays alive until
teardown so kthread_stop() is safe; it does not try to recover the data
path. A latched runtime_error is not cleared by anything in the driver
today, and recovering from a failed runtime suspend is a separate
problem from this fix.

You are right that polling every 20 ms for as long as the lists are
non-empty is not a good steady state. In v7 the thread retries once per
second instead, and the first failure of a streak is logged, so the
dead data path is reported once rather than silently. It still does not
recover the data path from a latched runtime_error.

Thanks,
Tim
