Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108905;
	b=fhKjtmKjNczQJdeb1LaMjtlNNc2MrO7TILuoTvgl+7ogZP2hEY/VWAeoOyER6Y3dohOn
	 tFoxOYyjhBE7V/0NE+VL6LJR7Tw0/unDVAqabjcGd7wG1dSOLlJkHVu8qkbL7PUtx3PeD
	 5To1+qdwTL9ErYsMwrCZnl8z9ZH5ZHWCqELgdWGQCqCzmdH2YOm/HTR4jRrJR+aY/Vttk
	 T//z3TlA9vfTklUis02HZVdhSstvZ0Ut7I3fb1DiJOVYI54tskxpjeiIkB5iRBGt80DMY
	 Hif3YCWLYFIDx6jWoQecWbxTQ7na7P5xX/LvzkOXQyn/ifNvxSjAE5ljzcoNoKXaGnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qCKspVRVOBd/joD+05jOwyZUEmbfEcJyaUV6EH4dQXI=;
	b=P+0GWv5ymoS1i7FwkFc949Aq8l68d6P295XWPffz0i7g9JIvgIieMYDCJWw1nRiwl7gx
	 j/zlGns23yjrDVgD/wqNKoDaQ+wApUYQ46MUYLklytpjfisng5pLOjQcHWobF0JIe3iQ8
	 /JGqPSL/3f0k9ANtynvxmzY4AurylHLx6irtmShkH5xHAVfW8TR6z9nFNOcpPMr5r8oJB
	 XOcyrN6P65/K6pN5KKURcDDKmRCchmAoJwFYNnBqlwAw3LKGp+MUmSBl8UIbOcyCp7FdU
	 w2cygr4MxEgyOhlhgXVeBmVs7gbW1HWG3N/PWIcxDStr+oMeUmb8ORxpa0+/GIdTZcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tY1GHSnq;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36798606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36798606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tY1GHSnq
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38431138772so1592343eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108904; x=1795713704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCKspVRVOBd/joD+05jOwyZUEmbfEcJyaUV6EH4dQXI=;
        b=tY1GHSnqNR5ofMb1KioIS30YqaVKjUQtv8ZTqlstmaKO4w/8ZaZbSm1ddKTcujkZa2
         R3g8/1W6C9XtF22hSugqhJXqnLVtl1uzVFDAYZWjpXOBEi2ztEMt8htA2wIYyKtFRJ6y
         iQC/38ScTWx2TQhuiaB6vobA2RZBPpehVB7pW7TEQTLIX38tnlgCZZAjkSN0lR//zDAf
         dZpjfseEIicTrqBR5acP+DlS+ziAa56GugpDYEu/6ODeR7E/l+g3oQrVendDD8IxOItr
         njW1QKaA/0QWH/JjppXBIeb0vaGYnHoyEHpAgWGTQmh1jO7ueA5x4x51gFUhWvbfVCMw
         Vpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108904; x=1795713704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qCKspVRVOBd/joD+05jOwyZUEmbfEcJyaUV6EH4dQXI=;
        b=RLrCsrKxflRKmeq92trbDXjrjeKq79NbJ3yUACs5WX2tV9+fVc6UgyYuGpJ48n8W40
         5MqTd0dY+NABJywzEy4KNOoNwW6dWFHD1Z8auV/BPb+4kpXCrICTV0yWljCZ2rg+aAdx
         OfJtgrm2Qhw8ZrnlhadVWcagDeQGRC1mBavpmDu3mSFRxrB4NaOo8USCUAB4ikHdWwXV
         kGKTo50s+jJzBt0oKsgMguE3wEwKbMtk6bG9dXnc/reoKY6RfxbQYXAjORQ+tnyOxZ88
         tLNbl3+2AIsArXnRpsZwTs9yuLGycycXiPOSAX1/D0qswOPWNSndEJ0rJAS6a6gS9sza
         jBHQ==
X-Gm-Message-State: APuU4Z/sFiAbdtxvcJ7jRGqewSDipbcubhxetw2D9fyx4OZz3viMh8+b
	1QY1WxMRr50nZVB9DWh2ZRxJHJGv4xf6bO75O78Xz4fwoM3xc3C5/15EyqOV067N
X-Gm-Gg: AZFdTZcAdc+24iHLUR0flKLgXtuegqIAIPA6Wn5qq3nXCEuzn8EiZ3I3bZwpwcF8HdQ
	7+Bh7Y3BjcXkGcRW+O/OPHoLiy2aM/RD+9Cv7BH6qNX0pt94ReJhsgM0Tj1on8KXQ+hpCHxXTVv
	kL/e+IANybjpuEs51ZUcZya1oUaCQh4/39oh2+2ZiixfsahA8feJjYa1G+TnCVNGTtLZS1wMUfJ
	8DNPSunk40JPklOSGKOOBs+EBgWBHLN9SCjWennQtkTjoDU0ppI7sHvco63k2/4B3M5eXjVuo0Q
	ma4QxPomE0DUg00XHJSEP2ZHnFIDXCAFK0jJYwb/XOLgx3hljhIPwRtp2/wxlFUcmXfup16nigk
	galJbtNK0lOzIPPkY8BJcJYapJTg2l0EDF9a7TqsFJHLq3v9ZquwoP9Zzi6LSeNpvfRNokXME/J
	liCsVvN3z9Xs569yB2t+V4Ocgl9ZkL2UKdcCLYRJUc8nCdlzdl+fRmTPHzOSjv9rPCeWLGLR52I
	Lj8UfTRRjZzHGPpQZ5dYvZeun3qZ0u5x3teRdz9ZOTuNeUAYHzzlYPpcF+RpADXwkj+dLDwOlHQ
	XsCY8x51sgk3khNk4sAy/QGjgjF2IcdmwFDgRDe9RJS3od4=
X-Received: by 2002:a05:693c:8211:b0:36f:202c:48 with SMTP id 5a478bee46e88-3857045092emr15315eec.14.1795108904018;
        Thu, 19 Nov 2026 09:21:44 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672cf745sm226887eec.18.2026.11.19.09.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:21:43 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org,
	dev@openvswitch.org
Cc: Aaron Conole <aconole@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Ilya Maximets <i.maximets@ovn.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v9 3/3] netlink: specs: correct the ovs specs where they do not match the kernel
Date: Thu, 19 Nov 2026 12:21:18 -0500
Message-ID: <20261119172118.3416958-4-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119172118.3416958-1-houminxi@gmail.com>
References: <20261119172118.3416958-1-houminxi@gmail.com>
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

The vport netnsid attribute is signed in the kernel: vport_policy declares
it NLA_S32 and ovs_vport_cmd_fill_info() sends it with nla_put_s32(). A
client reading it as unsigned turns the -1 that peernet2id_alloc() returns
when it cannot assign an identifier into 4294967295. Declare it s32, and
say the same in the uapi comment, which also never said the value is -1
when no identifier could be assigned.

Two dumps shared a request list with their get operation, while the dump
handlers read no request attribute. Each dump now has a request list of its
own with no attributes, so neither advertises an attribute the kernel would
ignore.

Four lists named attributes their handler never reads or sends. The vport
delete goes through lookup_vport() and reads no type. The datapath reply
does not carry upcall-pid, which the uapi reserves for the new request, so
the reply list drops it and the ynl selftest stops printing that field. The
vport new request named the nested options, which the kernel accepts and
ignores. The packet miss event shared its list with the userspace action
event, which alone fills userdata, actions, the tunnel key and the length
of a truncated packet, so the miss event now lists only what a miss sends.

The vport get request can also be answered by port number, because
lookup_vport() falls back to it when the request carries no name, so list
port-no there. The datapath get is served by the name, or by the header
ifindex when the name is absent, which its doc now says, and all four ovs
specs document the header struct the same way. The vport new doc gains the
constraint that an ifindex is only accepted for an internal vport.

The uapi note on the vport name now covers requests other than new and
dump, and names the header member the lookup uses. The note on options says
what the kernel does with the attribute instead of leaving it to the vport
type.

The packet spec declared neither the validate flags nor the admin
permission that the kernel registers on the execute operation.

The vport spec also declared family version 2 where the kernel registers 1.

None of this comes from the set operations added earlier in the series; the
specs have been wrong since the families were introduced.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
v9:
 - Complete the note on the vport name. The v8 wording stopped after
   "dp_ifindex from"; the missing tail names the attribute and the header
   member the lookup uses.

 Documentation/netlink/specs/ovs_datapath.yaml | 16 +++++++++----
 Documentation/netlink/specs/ovs_packet.yaml   | 20 +++++++++++-----
 Documentation/netlink/specs/ovs_vport.yaml    | 24 ++++++++++++-------
 include/uapi/linux/openvswitch.h              | 16 ++++++++-----
 tools/net/ynl/tests/ovs.c                     |  5 ++--
 5 files changed, 53 insertions(+), 28 deletions(-)

diff --git a/Documentation/netlink/specs/ovs_datapath.yaml b/Documentation/netlink/specs/ovs_datapath.yaml
index 6232760224dc..94ab15251e2a 100644
--- a/Documentation/netlink/specs/ovs_datapath.yaml
+++ b/Documentation/netlink/specs/ovs_datapath.yaml
@@ -12,6 +12,8 @@ definitions:
   -
     name: ovs-header
     type: struct
+    doc: |
+      Header for OVS Generic Netlink messages.
     members:
       -
         name: dp-ifindex
@@ -118,24 +120,28 @@ operations:
   list:
     -
       name: get
-      doc: Get / dump OVS data path configuration and state
+      doc: |
+        Get one OVS data path by name, or by the ifindex in the header when
+        the request carries no name.
       value: 3
       attribute-set: datapath
       dont-validate: [strict, dump]
-      do: &dp-get-op
+      do:
         request:
           attributes:
             - name
-        reply:
+        reply: &dp-reply
           attributes:
             - name
-            - upcall-pid
             - stats
             - megaflow-stats
             - user-features
             - masks-cache-size
             - per-cpu-pids
-      dump: *dp-get-op
+      dump:
+        request:
+          attributes: []
+        reply: *dp-reply
     -
       name: new
       doc: |
diff --git a/Documentation/netlink/specs/ovs_packet.yaml b/Documentation/netlink/specs/ovs_packet.yaml
index e4c5f24b3b01..a9ee84be6e22 100644
--- a/Documentation/netlink/specs/ovs_packet.yaml
+++ b/Documentation/netlink/specs/ovs_packet.yaml
@@ -22,6 +22,8 @@ definitions:
   -
     name: ovs-header
     type: struct
+    doc: |
+      Header for OVS Generic Netlink messages.
     members:
       -
         name: dp-ifindex
@@ -97,14 +99,10 @@ operations:
       value: 1
       attribute-set: packet
       event:
-        attributes: &event-attrs
+        attributes:
           - packet
           - key
-          - userdata
-          - actions
-          - egress-tun-key
           - mru
-          - len
           - hash
     -
       name: action
@@ -112,12 +110,22 @@ operations:
       value: 2
       attribute-set: packet
       event:
-        attributes: *event-attrs
+        attributes: &event-attrs
+          - packet
+          - key
+          - userdata
+          - actions
+          - egress-tun-key
+          - mru
+          - len
+          - hash
     -
       name: execute
       doc: Apply actions to a packet.
       value: 3
       attribute-set: packet
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
diff --git a/Documentation/netlink/specs/ovs_vport.yaml b/Documentation/netlink/specs/ovs_vport.yaml
index af7ee56f5f90..7626b578c568 100644
--- a/Documentation/netlink/specs/ovs_vport.yaml
+++ b/Documentation/netlink/specs/ovs_vport.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
 ---
 name: ovs_vport
-version: 2
+version: 1
 protocol: genetlink-legacy
 uapi-header: linux/openvswitch.h
 
@@ -12,6 +12,8 @@ definitions:
   -
     name: ovs-header
     type: struct
+    doc: |
+      Header for OVS Generic Netlink messages.
     members:
       -
         name: dp-ifindex
@@ -116,7 +118,7 @@ attribute-sets:
           min: 0
       -
         name: netnsid
-        type: u32
+        type: s32
       -
         name: upcall-stats
         type: nest
@@ -128,7 +130,9 @@ operations:
   list:
     -
       name: new
-      doc: Create a new OVS vport
+      doc: |
+        Create a new OVS vport. An ifindex is accepted only for an
+        internal vport; any other type returns -EOPNOTSUPP.
       attribute-set: vport
       dont-validate: [strict, dump]
       flags: [uns-admin-perm]
@@ -140,7 +144,6 @@ operations:
             - upcall-pid
             - port-no
             - ifindex
-            - options
     -
       name: del
       doc: Delete existing OVS vport from a data path
@@ -151,17 +154,19 @@ operations:
         request:
           attributes:
             - port-no
-            - type
             - name
     -
       name: get
-      doc: Get / dump OVS vport configuration and state
+      doc: |
+        Get one OVS vport by name, or by port number when the request
+        carries no name.
       attribute-set: vport
       dont-validate: [strict, dump]
-      do: &vport-get-op
+      do:
         request:
           attributes:
             - name
+            - port-no
         reply: &dev-all
           attributes:
             - port-no
@@ -172,7 +177,10 @@ operations:
             - ifindex
             - netnsid
             - upcall-stats
-      dump: *vport-get-op
+      dump:
+        request:
+          attributes: []
+        reply: *dev-all
     -
       name: set
       doc: |
diff --git a/include/uapi/linux/openvswitch.h b/include/uapi/linux/openvswitch.h
index bd77e6fb4a95..6ee048a9e812 100644
--- a/include/uapi/linux/openvswitch.h
+++ b/include/uapi/linux/openvswitch.h
@@ -293,7 +293,9 @@ enum ovs_vport_type {
  * packets sent or received through the vport.
  * @OVS_VPORT_ATTR_IFINDEX: Provides the ifindex of a vport, or sets the desired
  * ifindex while creating a new vport with type %OVS_VPORT_TYPE_INTERNAL.
- * @OVS_VPORT_ATTR_NETNSID: Provides the netns id of the vport if it's not local.
+ * @OVS_VPORT_ATTR_NETNSID: Provides the netns id of the vport if it's not
+ * local, as a signed 32-bit value.  The value is -1 when the identifier could
+ * not be assigned.
  * @OVS_VPORT_ATTR_UPCALL_STATS: Provides upcall statistics for a vport.
  * Contains nested %OVS_VPORT_UPCALL_ATTR_* attributes.
  *
@@ -303,12 +305,14 @@ enum ovs_vport_type {
  * For %OVS_VPORT_CMD_NEW requests, the %OVS_VPORT_ATTR_TYPE and
  * %OVS_VPORT_ATTR_NAME attributes are required.  %OVS_VPORT_ATTR_PORT_NO is
  * optional; if not specified a free port number is automatically selected.
- * Whether %OVS_VPORT_ATTR_OPTIONS is required or optional depends on the type
- * of vport.  None of currently supported vport types support options.
+ * None of currently supported vport types support options, so
+ * %OVS_VPORT_ATTR_OPTIONS is ignored in a %OVS_VPORT_CMD_NEW request and
+ * rejected with -EOPNOTSUPP in a %OVS_VPORT_CMD_SET request.
  *
- * For other requests, if %OVS_VPORT_ATTR_NAME is specified then it is used to
- * look up the vport to operate on; otherwise dp_idx from the &struct
- * ovs_header plus %OVS_VPORT_ATTR_PORT_NO determine the vport.
+ * For requests other than new and dump, if %OVS_VPORT_ATTR_NAME is specified
+ * then it is used to look up the vport to operate on; otherwise dp_ifindex
+ * from the &struct ovs_header plus %OVS_VPORT_ATTR_PORT_NO determine the
+ * vport.
  */
 enum ovs_vport_attr {
 	/* private: */
diff --git a/tools/net/ynl/tests/ovs.c b/tools/net/ynl/tests/ovs.c
index d49f5a8e647e..fea7609a68b9 100644
--- a/tools/net/ynl/tests/ovs.c
+++ b/tools/net/ynl/tests/ovs.c
@@ -16,9 +16,8 @@ static void ovs_print_datapath(struct __test_metadata *_metadata,
 		return;
 
 	EXPECT_TRUE((bool)dp->_hdr.dp_ifindex);
-	ksft_print_msg("%s(%d): pid:%u cache:%u\n",
-		       dp->name, dp->_hdr.dp_ifindex,
-		       dp->upcall_pid, dp->masks_cache_size);
+	ksft_print_msg("%s(%d): cache:%u\n",
+		       dp->name, dp->_hdr.dp_ifindex, dp->masks_cache_size);
 }
 
 FIXTURE(ovs)
-- 
2.56.1

