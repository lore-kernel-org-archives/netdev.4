Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727621;
	b=0VLP8b8g2qwnmwLYx33UdwZcbZLdZPry/NsieIRkb5k3STnuIhgImuSPi3LNdO8fJHy3
	 RthAgjxbgxcJ1jIevEJl1/FNI5YRdwmuj79dI9FNJBOAcwDi4iZSxhHSQoV/244alF9df
	 kyDZfoejzaM6KfsXSQEWYLdntf4wapfkcwdNFtgZJs4w2xH8Q8PlL0zVMPcl2gq2k+R5Y
	 80h9luwHoOFbB04cQfCWsqtZifYTJMxFQMqYIkQJgJThmYhq6Ml1GCa1bKDBmUGmsh2rT
	 5xI9sNrYP7XTXE0rMSOEfuPw1xKS58XmsqwRaG0baujcP4jINz6CcnXc/Ju7/E8RzIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JUvotkktEds6gRJwB702NqNzkgXlw2/4WsAAh7Vg0es=;
	b=Ww+mhAUpd2OVX1PpG2wilCxgHD1hDiaMlC2Mfaq/Kd2kFe8RxIAjxxMKh0a39G0u1tD7
	 Ifry+gS8xPaaEiVLc34t3tLQvWXVY6sDN7IKoU/i4xKlscNevGj5/UovtuE4GvxKE/q4k
	 6biUXZuSfiAlBkWLag85fwjSZRrux6YUaHC6HgNs96z48xLCJ9G6CGO336ZarYq35zOm1
	 KMOprsCBE1ZxEB/wwPrVG4iV9OEoqGkPEv55tAfuGJgjVIzQovJuU8ORcUmYzv84fXmmt
	 a8ZVyhxRb7s2+RQXrdV9k+vkvTFoeaS7dpUk9YwPChgXOd6QhPUrhIEAtU+uoP0iUZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GMfVr6J6;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3167B606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 07:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3167B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GMfVr6J6
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3704d30b84fso2939419eec.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 23:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727620; x=1795332420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUvotkktEds6gRJwB702NqNzkgXlw2/4WsAAh7Vg0es=;
        b=GMfVr6J6eNBbqO9kJa2sDR0nx+yJNVWNC3KmLF/3cMgTHI6+TP+H9bBSZ5nsogX/gL
         u0FMOVCq9qwHRXRdC990QP4DHrvCN0Ji9wrHKzX4VtPqb6FHGIUhfuACv+K536cORkd0
         y0AIUypEwcbO7srqU3ZC+7Sur3z3fb2YX3pHRadjeLPrWcY3mcsEhtBRED0RZKZ58aJD
         AgxY7YasWkjTY8yNNp7TNax92LdaPRHgbg/DNIfGZSTqicHEDv6Y5TnXTQ9JCDVrDoVV
         Oi/+FH/8G7X4q3+/GX0/GNmVHOHsVwQv2xfGrJ16BTUrOU2+x7Cgbcr2GqWV9dUultnZ
         U1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727620; x=1795332420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JUvotkktEds6gRJwB702NqNzkgXlw2/4WsAAh7Vg0es=;
        b=NahPbEDdQnhx8znP4nBfRUHbAru7Xx4Bcsi5r/DPpQm00twq0X62EY72JxFBheTdMu
         9oCu0f70aWjEFitkLM20fNtLwmpwEbu8ustFXMUuPYCMeK4CqP5Kbz9AT8js0XPgBTsm
         Ji1+pyCu/BTmYDod5UrZp2OUbpfrRKJZOGwRuOcQHl+ThoVwshYD8WApmqmfav3rlra0
         WonLuXeMn2GuagQhrA3T1kws35ckmL50dGv6d2jm8Yf6aAJUS2miwa3ThObFX9J4rdtn
         UQTimg+CXJZdL8m2BYtTWjIU6KuYD42nlcQvgwvepqRYpD0IRMAkIjP1KKC7ZzLqnX+C
         LJHg==
X-Gm-Message-State: APuU4Z+1xOYVH/kc1U/L6niGOY2Jd6UxOEESWg4NjM07C4Ju0z9h7Is8
	VwLFapwxgrm++C/1Xuu6DOkIXnsl0O9EpIjekHEz4lVtBqljvAw1d2TAfDw22CL0
X-Gm-Gg: AYBFou3+oKGBaFazhQ5BG1cf3s1toQ28/Yzs5Z9oZwi42lDzfrWrYl1kYa798P9320t
	D52U9Qtf3J0bCD2YMuk5SpMeNoMBEl1ATg2ZnYV2tzlLNDNiGQ5HsxLXJ3sZTQW35d1OJOGMk9M
	3zgyJ/bfWlwLornhWNpL0mL75zCTBOV5D7lIJj0Ug+C2zCBU6E5bsr0lMvqMyBm94uyiSg5VjkC
	1tXwXWQfyp8OiTiqveUs7EIpqaALUpR6SPfwlZYme6n++JL/akyazs8yyygLLCotnh3ywaIcv4q
	5UdqH0ODa2Zc1D9PhpyHe3647zFuPH5kFVvrhHCfimsJpDyDabdSfdasaGpzeMdKxCbtK9ghHG3
	iCkhlLHoGmi4Q1pN0gI6ivxA2mAM/7y3QUmAH0ntBWSo0wRmE2xYuAkkhi+QdlyGwmMrRE+aFOy
	onQ6eRP9xqVkCA18TYvRIjnuX2RqD40c/8JvRoytWbraash/K7jLXgO5cnG6R6UKHS+bM/GUNEY
	sbzLNr86RMb9evRmiTnqvOPVB5kLtQCnuWfxyPjQmnYK1fYiuEIXiGgHUvs7kqjDUdlBPSdI7kX
	RZEOJ3LE9YcnoucACggxosr5
X-Received: by 2002:a05:7300:d40b:b0:376:b957:c08 with SMTP id 5a478bee46e88-37966c489d6mr7931449eec.9.1794727620159;
        Sat, 14 Nov 2026 23:27:00 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm22411234eec.3.2026.11.14.23.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:26:59 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net-next v8 2/3] netlink: specs: add ovs datapath and vport set operations
Date: Sun, 15 Nov 2026 02:26:37 -0500
Message-ID: <20261115072638.3163018-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115072638.3163018-1-houminxi@gmail.com>
References: <20261115072638.3163018-1-houminxi@gmail.com>
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

Both families register a SET command that the spec never described, so a
YNL client could not change an existing datapath or vport. The datapath
NEW command also gains the masks cache size, the per-cpu upcall pids and
the ifindex, which its handler reads. new, del and set take
CAP_NET_ADMIN, which is GENL_UNS_ADMIN_PERM in the kernel.

The datapath SET command changes the user features, the masks cache size
and the per-cpu upcall pids. A request that leaves out user-features is
read as zero, which clears the features set earlier. per-cpu-pids takes
effect only when the same request sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU
in user-features; without that bit the pids are dropped and the request
still succeeds.

The vport SET command changes the upcall pid. It finds the vport by name,
or by port number when the request carries no name. An ifindex or options
are rejected with -EOPNOTSUPP, and a type that differs from the vport's
type with -EINVAL. The type only has to match. The vport NEW request list
gains the port number, which its handler reads.

The ifindex attribute is signed in both policies, which read it with
nla_get_s32_default() and reject anything below zero, so declare it as
s32 to match them rather than leaving it u32. The field in the generated
reply struct becomes __s32 with it. The reply itself does not change:
ovs_vport_cmd_fill_info() still puts the value as u32, and the two types
have the same width.

The ops in both families skip strict and dump validation in the kernel,
so the spec says so for get, new, del and set.

Both SET commands also send the updated object to the family's multicast
group, and to the requester when the request sets NLM_F_ECHO, which the
new op docs say.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 Documentation/netlink/specs/ovs_datapath.yaml | 37 ++++++++++++++++++-
 Documentation/netlink/specs/ovs_vport.yaml    | 31 +++++++++++++++-
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/Documentation/netlink/specs/ovs_datapath.yaml b/Documentation/netlink/specs/ovs_datapath.yaml
index f7b3671991e6..6232760224dc 100644
--- a/Documentation/netlink/specs/ovs_datapath.yaml
+++ b/Documentation/netlink/specs/ovs_datapath.yaml
@@ -108,7 +108,9 @@ attribute-sets:
         sub-type: u32
       -
         name: ifindex
-        type: u32
+        type: s32
+        checks:
+          min: 0
 
 operations:
   fixed-header: ovs-header
@@ -119,6 +121,7 @@ operations:
       doc: Get / dump OVS data path configuration and state
       value: 3
       attribute-set: datapath
+      dont-validate: [strict, dump]
       do: &dp-get-op
         request:
           attributes:
@@ -135,24 +138,54 @@ operations:
       dump: *dp-get-op
     -
       name: new
-      doc: Create new OVS data path
+      doc: |
+        Create new OVS data path. per-cpu-pids takes effect only when the
+        same request sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU in user-features.
       value: 1
       attribute-set: datapath
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
             - name
             - upcall-pid
             - user-features
+            - masks-cache-size
+            - per-cpu-pids
+            - ifindex
     -
       name: del
       doc: Delete existing OVS data path
       value: 2
       attribute-set: datapath
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
+      do:
+        request:
+          attributes:
+            - name
+    -
+      name: set
+      doc: |
+        Modify an existing OVS data path. The kernel treats a missing
+        user-features attribute as zero and clears the previously set
+        features. per-cpu-pids takes effect only when the same request
+        sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU in user-features. A
+        successful set also sends the updated data path to the
+        family's multicast group, and to the requester when the
+        request sets NLM_F_ECHO.
+      value: 4
+      attribute-set: datapath
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
             - name
+            - user-features
+            - masks-cache-size
+            - per-cpu-pids
 
 mcast-groups:
   list:
diff --git a/Documentation/netlink/specs/ovs_vport.yaml b/Documentation/netlink/specs/ovs_vport.yaml
index fa975f8821b6..af7ee56f5f90 100644
--- a/Documentation/netlink/specs/ovs_vport.yaml
+++ b/Documentation/netlink/specs/ovs_vport.yaml
@@ -111,7 +111,9 @@ attribute-sets:
         type: unused
       -
         name: ifindex
-        type: u32
+        type: s32
+        checks:
+          min: 0
       -
         name: netnsid
         type: u32
@@ -128,18 +130,23 @@ operations:
       name: new
       doc: Create a new OVS vport
       attribute-set: vport
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
             - name
             - type
             - upcall-pid
+            - port-no
             - ifindex
             - options
     -
       name: del
       doc: Delete existing OVS vport from a data path
       attribute-set: vport
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
@@ -150,6 +157,7 @@ operations:
       name: get
       doc: Get / dump OVS vport configuration and state
       attribute-set: vport
+      dont-validate: [strict, dump]
       do: &vport-get-op
         request:
           attributes:
@@ -165,6 +173,27 @@ operations:
             - netnsid
             - upcall-stats
       dump: *vport-get-op
+    -
+      name: set
+      doc: |
+        Modify an existing OVS vport. The vport is picked by name, or by
+        port number when the request carries no name. An ifindex or options
+        are rejected with -EOPNOTSUPP, and a type that differs from the
+        vport's type with -EINVAL. The type only has to match; the one
+        attribute that changes state is upcall-pid. A successful set
+        also sends the updated vport to the family's multicast group,
+        and to the requester when the request sets NLM_F_ECHO.
+      value: 4
+      attribute-set: vport
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
+      do:
+        request:
+          attributes:
+            - name
+            - type
+            - upcall-pid
+            - port-no
 
 mcast-groups:
   list:
-- 
2.56.0

