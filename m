Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794701934;
	b=4Wl35lj8cELvbdPGX9CfJFSw4mnPeraygPUZ6brxtJCidrO95GOPuG4q6WxLTyQ8Krvm
	 uAih6/PRlCdmt5VUWcxdCrfkPKh8E7LGYmKpbq0qzvSIvsmpMLN6NKFAejq6BqKX1SZXi
	 0Sx0N9E7o4bxi1pcjxnSQMhKzgCtoTAwSW+Ny8yV8Ls3WLm9yB8ZdKhJy3J64gg8n+RsM
	 QYdE94a20m3K9ZIvF+1NyVcoFvH/o865eXUSyYxRy4Oql6jG5prquH4LOIAXMe0JpMn6R
	 Mg4Tb+bmHK2HxXIqsxL0XET6CbBcZsUfW+DIC/HKvGXBd+mKqpC+2PYNzhJuExvs+bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794701934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JejavGOhT29+kYZxPl7g8FlCzMWntZ9rMxIL0KrRCgg=;
	b=rPlEtPwzkAk34LQLoss0RXJT0nAfn1RIvCpx6oNH5RMLLMuHkSn4QTZpAW5q/HI1QmFy
	 YM14gJDuQiDwzOjAgd0uZaUPG4wQaGr0M5JYkZbRxCOewquUldmCqsfstfyR3/Wns421V
	 49GXy46+Mu/RGTUXeMTZioSy1K3/r0tg/RoAQiO2/+ZNUEAAIDO7Svgs/lDXx/8h36hyk
	 5ivc3U4kanwpZKO1C7LRvgLZr0ncUxtnD+SGpjFEW/8M8vBSQAO7LxyAgiuFRvYcY8iUm
	 /d0gELCeBkpTsnns3Ne33qoCXT1eayCVzrjhT9gH3bfQiMWnZgqd9Utlps7NhOLcwDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CLZiqkUi;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF1606A330
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 00:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8AF1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CLZiqkUi
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-943e8d35f74so287664185a.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794701933; x=1795306733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JejavGOhT29+kYZxPl7g8FlCzMWntZ9rMxIL0KrRCgg=;
        b=CLZiqkUiy/GqoMK+wOyDEYP2H1dJ227AZJ9Z8XC3+j1I4tBq57Tz++CXSvWNkYlb1I
         VH2/IrtUDdGMYYvSoMK49waU3rQ192zmkKPi5Wg9y4HR5rwHpUHO1D5pTrHi/mjEW9ct
         GjKEr6kPgjPz7Ih1wSoqksm3BM/X1CgQs/Nd7pC9tQm3Eg//Y544Zu37OsmxUkHS3zwG
         v6YsLfw9Z91eCnVaMbOCLeTv8KXuhpzuciXLUppvC8Iecs9A3aeapVStAQ1VxeYMJ7qc
         l1ArYTSfSCx9dF6vfeVBrF9tsGfoKDta0ay7l7p2DzlbvCgV7rpqxyL6obw1+5WQeRbb
         OTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794701933; x=1795306733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JejavGOhT29+kYZxPl7g8FlCzMWntZ9rMxIL0KrRCgg=;
        b=LCd2tRE7P5PCoW3TuIAmbTUfBY6a7nt/23PVzRglVBfOeU9QoCxhKBFpsGZDVbSkhp
         sxzZyk4w6QRVS2RfFKOpcgWUrgt64P/EamI3YKvGMxQ8n+FipwVjQGB66Pn3lEgcFDCm
         45YUJavKWPgNRUSw8tugskXR6wPnUIFSRnzKqrGw7ivJt+sBCnvGH1DF+oDwemjj9sVs
         FnsPybeRJkSbG67AZVjPpMW3LiyHSkvqdWd1HTt0haFM5nw7BdFUdITr1ghkburWc3F0
         n9WMAAirnIpdl6N9Ls2PXmiyeW95ifB4EbHI2ruvQTappOJCFNTBHme5civuxx7Mopz5
         8bjQ==
X-Forwarded-Encrypted: i=1; AL+hErEgm5Jn3R5gNnNUW0YOL+yduGh9V8Ve5j9ucSikor1btyH68f7QIr9rpRFE/72Ids2GuXq2qq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jOUmYEzVQup1FKY1Eq2xUSq27KnLn8D52P5B0Jyur8hSAMvwh
	JNGTq1MaHtOSnTgw4jMVtSb76dl44p3s+Jm8lW/F9QhJFHGS/34NxAHTzwUgVLE24dU=
X-Gm-Gg: AYBFou0eRBCPO/TgHiei8PevrP4m3ScEyhb3/U6+a8Q5m1t8i2vZHHEorHSxM7/8MwV
	sdKF4OaN6oxvGwdwWbpX6TiKe4f5uA0UbFGSF0blGaNangUawrQ/t5Tit++bkG5TlNa6pjrKj9v
	bWLmNJXcY9/MeXDAH3GozNoCwfMNW80j6D7xWhUBTLPg7RZTQ6nrD9c3XeRtJUirll4kpTnWNwD
	VrG9vzL0SQiru9TkzaJGLQRlFFoBx/RwL/Fj4u4BbJZuYO9GgRYo1eAixSlAcG5C777Z0XTUca0
	/gseYA3xmxTVrqrrdJnONUGvJnM42cKpp6VhaYHSYwyLYC0UznOGz3G5BsjYa7Te1h5KZTW1SL5
	IFq+xRdsVwDaA2ArIYvdMAfvGC6J9kSQEt7I0we9OioOkojZyk0bvVgfvWZqo2pm7K6mcwedRCb
	4Z+/ZBDt054TbvRGt/PP5tcgq1xaJJCTXw9RyoXASu1SMyfm9+S5PeeOUgQ9dLw6A7GjtzLAFSA
	2Uedoh/TcnCROPH9coYvhJALSh/JKe4mjK0nZMNAwcgKM5FzCYdFEDKkKo6C8cvl/c8b/togyUY
	yhE0vw==
X-Received: by 2002:a05:620a:2b96:b0:93e:5fbf:a41c with SMTP id af79cd13be357-9494bbb7e8dmr1069300885a.16.1794701932860;
        Sat, 14 Nov 2026 16:18:52 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8f92bbsm512903785a.40.2026.11.14.16.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:18:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSNxL-00000005ESx-1JsN;
	Sat, 14 Nov 2026 20:18:51 -0400
Date: Sat, 14 Nov 2026 20:18:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: leon@kernel.org, achender@kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org, hdanton@sina.com,
	hackerowskiy@gmail.com,
	syzbot+ccdb5058c3df2d94811c@syzkaller.appspotmail.com
Subject: Re: [PATCH] RDMA/cma: add rdma_destroy_id_wq() and use it from RDS
Message-ID: <20261115001851.GH2532299@ziepe.ca>
References: <20261114150541.1908-1-chenaibing@cmss.chinamobile.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114150541.1908-1-chenaibing@cmss.chinamobile.com>

On Sat, Nov 14, 2026 at 11:05:41PM +0800, Aibing Chen wrote:
> syzbot reported a possible circular locking dependency between
> rds_trans_sem and the RDMA CM handler mutex:
> 
>   CPU0 (bind path)                    CPU1 (CM callback path)
>   ----                                ----
>   down_read(&rds_trans_sem)           mutex_lock(&handler_mutex)
>   rds_ib_laddr_check()                cma_ib_req_handler()
>     rdma_destroy_id()                   rds_ib_cm_handle_connect()
>       mutex_lock(&handler_mutex)          rds_conn_create()
>                                             rds_trans_get_preferred()
>                                               down_read(&rds_trans_sem)
> 
> rds_ib_laddr_check_cm() destroys the CM id from inside
> rds_trans_get_preferred()'s read-side critical section, while CM
> callbacks create RDS connections (taking the same read lock) from
> under handler_mutex.
> 
> Break the cycle by destroying the CM id asynchronously: add
> rdma_destroy_id_wq(), which queues the destruction on cma_wq, and
> switch rds_ib_laddr_check_cm() to it.  The destroy work is embedded
> in struct rdma_id_private, which keeps the id alive until the work
> runs; rds does not touch cm_id after the destroy call.

This doesn't seem like it should be the core codes problem? Why can't
rds do the workqueue?

Jason
